class Server < Granite::Base
  connection pg
  table servers

  belongs_to :bot

  column id : Int64, primary: true
  column name : String
  column region : String
  column users : Int32
  column message_count : Int32
  column icon : String?
  timestamps

  validate :name, "is required", ->(server : Server) do
    (name = server.name) ? !name.empty? : false
  end

  validate :region, "is required", ->(server : Server) do
    (region = server.region) ? !region.empty? : false
  end
end
