class StatsApiController < ApplicationController
    def send_data
        bot = Bot.find_by(token: request.headers["key"])
        if bot.nil?
            halt!(401, "Unauthorized")
        else
            if params[:message].starts_with? bot.prefix
                message = params[:message].gsub(bot.prefix) { "" }
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

                server = bot.servers.find_by(name: params[:server])
                if server.nil? 
                   server = Server.new(name: params[:server], bot_id: bot.id, region: params[:server_region], users: params[:member_count].to_i, message_count: 1)
                   activity.servers += 1
                   activity.save
                else
                    server.message_count += 1
                    server.users = params[:member_count].to_i
                end
                server.save
            else
                halt!(400, "Bad Request - Malformed Prefix")
            end
        end
    end
end
