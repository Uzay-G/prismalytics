class Activity < Granite::Base
  connection pg
  table activities

  belongs_to :bot

  column id : Int64, primary: true
  column value : Int32
  column servers : Int32
  timestamps

  validate :value, "is required", ->(activity : Activity) do
    (value = activity.value) ? !value.nil? : false
  end

  validate :servers, "is required", ->(activity : Activity) do
    (servers = activity.servers) ? !servers.nil? : false
  end
end
