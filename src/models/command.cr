class Command < Granite::Base
  connection pg
  table commands

  belongs_to :bot

  column id : Int64, primary: true
  column command : String
  column occurences : Int32
  timestamps

  validate :command, "is required", ->(command : Command) do
    (command = command.command) ? !command.empty? : false
  end

  validate :bot_id, "is required", ->(command : Command) do
    (bot_id = command.bot_id) ? !bot_id.nil? : false
  end
end
