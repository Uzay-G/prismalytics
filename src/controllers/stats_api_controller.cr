class StatsApiController < ApplicationController
    def send_data
        bot = Bot.find_by(token: request.headers["key"])
        messages = JSON.parse(params[:commands])
        if bot.nil?
            halt!(401, "Unauthorized")
        else
            user = bot.user
         #   if user.last_request.nil? || (user.last_request.not_nil! - Time.utc).minutes >= 1
                user.last_request = Time.utc
                user.save
                messages.as_h.each do |content, occurences|
                    if content.starts_with? bot.prefix
                        message = content.gsub(bot.prefix) { "" }
                        command = bot.commands.find_by(command: message)
                        if command.nil?
                            command = Command.new(command: message.split(" ")[0], bot_id: bot.id, occurences: occurences.as_i)
                        else
                            command.occurences += occurences.as_i
                        end
                        command.save
                    end
                end

                activity = Activity.where(:created_at, :gt, Time.utc.at_beginning_of_day).where(bot_id: bot.id)
                if activity.select.empty?
                    activity = Activity.new(bot_id: bot.id, value: 1, servers: Server.where(bot_id: bot.id).select.size)
                else
                    activity = activity.select.first
                    activity.value += 1
                end
                activity.save

                if params[:save_server]
                    servers = JSON.parse(params[:servers])
                    servers.as_a.each do |server|
                        server_entry = bot.servers.find_by(name: server["name"].as_s)
                        if server_entry.nil? 
                            server_entry = Server.new(name: server["name"].as_s, bot_id: bot.id, region: server["region"].as_s, users: server["member_count"].as_i, message_count: server["bot_messages"].as_i)
                            activity.servers += 1
                            activity.save
                        else
                            server_entry.message_count += server["bot_messages"].as_i
                            server_entry.users = server["member_count"].as_i
                            server_entry.region = server["region"].as_s
                        end
                        server_entry.save
                    end
                end
                return(200, "Response successful!")
           # else
            #    return(429, "Rate Limited")
           # end
        end
    end
end
