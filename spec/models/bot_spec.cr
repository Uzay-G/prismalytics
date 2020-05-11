require "./spec_helper"
require "../../src/models/bot.cr"

describe Bot do
  Spec.before_each do
    Bot.clear
  end

  describe "Validation" do
    it "succeeds on valid parameters" do
      bot = Bot.new(token: "aQeaweqeweqwdsfzdzsasadsadd", name: "Vibe", user: User.first)
      bot.valid?.should be_false
    end

    it "needs token" do
      bot = Bot.new(token: "", name: "Vibe", user: User.first)
      bot.valid?.should be_false
    end

    it "needs name" do
      bot = Bot.new(token: "aQeaweqeweqwdsfzdzsasadsadd", name: "", user: User.first)
      bot.valid?.should be_false
    end

    it "requires user" do
      bot = Bot.new(token: "aQeaweqeweqwdsfzdzsasadsadd", name: "Vibe")
      bot.valid?.should be_false
    end
  end
end
