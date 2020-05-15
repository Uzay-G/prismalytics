class StatsApiController < ApplicationController
    def send_data
        bot = Bot.find_by(token: request.headers["key"])
        if bot.nil?
            halt!(401, "Unauthorized")
        else
            message_data = JSON.parse(params[:message].not_nil!)
            server_data = JSON.parse(params[:server].not_nil!)
            if message_data["content"].as_s.starts_with? bot.prefix
                message = message_data["content"].as_s.gsub(bot.prefix) { "" }
                command = bot.commands.find_by(command: message.split(" ")[0])
                if command.nil?
                    command = Command.new(command: message.split(" ")[0], bot_id: bot.id, occurences: 1)
                else
                    command.occurences += 1
                end
                command.save

                activity = Activity.where(:created_at, :gt, Time.utc.at_beginning_of_day).where(bot_id: bot.id)
                if activity.select.empty?
                    activity = Activity.new(bot_id: bot.id, value: 1, servers: Server.where(bot_id: bot.id).select.size)
                else
                    activity = activity.select.first
                    activity.value += 1
                end
                activity.save

                server = bot.servers.find_by(name: server_data["name"].as_s)
                if server.nil? 
                   server_count = (bot.name == "Onyx") ? -1 : server_data["approximate_member_count"].as_i
                   server = Server.new(name: server_data["name"].as_s, bot_id: bot.id, region: server_data["region"].as_s, users: server_count, message_count: 1)
                   activity.servers += 1
                   activity.save
                else
                    server.message_count += 1
                    if bot.name != "Onyx" && server_data["approximate_member_count"]
                        server.users = server_data["approximate_member_count"].as_i
                    end
                end
                server.save
            else
                halt!(400, "Bad Request - Malformed Prefix")
            end
        end
    end
end
