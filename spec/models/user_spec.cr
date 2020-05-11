require "./spec_helper"
require "../../src/models/user.cr"

describe User do

  Spec.before_each do
    User.clear
  end

  describe "Validation" do
    it "succeeds on valid parameters" do
      user = User.new(password: "password", email: "dadasd@am.com")
      user.valid?.should be_true
    end

    it "requires email not to be blank" do
      user = User.new(password: "sadasd", email: "")
      user.valid?.should be_false
    end

  #  it "requires password to be at least 8 chars" do
   #   user = User.new(password: "sadasd", email: "dadasd@am.com")
    #  user.valid?.should be_false
  # end
  end
end
