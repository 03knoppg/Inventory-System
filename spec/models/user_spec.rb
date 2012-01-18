require 'spec_helper'

describe User do
  it "can be instantiated" do
    User.new.should be_an_instance_of(User)
  end

  it "can be saved successfully" do
    testUser = User.create(username: "testUser", email: "test@test.com", password: "userTest")
    testUser.should be_persisted
  end
end