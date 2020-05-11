class Bot < Granite::Base
  connection pg
  table bots

  belongs_to :user

  column id : Int64, primary: true
  column token : String
  column name : String
  column prefix : String
  timestamps

  validate :user_id, "is required", ->(bot : Bot) do
    (user_id = bot.user_id) ? !user_id.nil? : false
  end

  validate :name, "is required", ->(bot : Bot) do
    (name = bot.name) ? !name.nil? : false
  end

  validate :token, "is required", ->(bot : Bot) do
    (token = bot.token) ? !token.empty? : false
  end
end
