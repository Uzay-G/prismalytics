require "./spec_helper"
require "../../src/models/command.cr"

describe Command do
  Spec.before_each do
    Command.clear
  end

  describe "Validation" do
    it "passes on valid params" do
      command = Command.new(occurences: 0, command: "play", bot: Bot.first)
      command.valid?.should be_true
    end
    
    it "requires command name" do
      command = Command.new(occurences: 0, command: "", bot: Bot.first)
      command.valid?.should be_false
    end

    it "requires bot reference" do
      command = Command.new(occurences: 0, command: "play", bot: Bot.first)
      command.valid?.should be_false
    end
  end
end
