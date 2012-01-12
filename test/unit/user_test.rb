require 'test_helper'
require './game'
class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  describe User do
    describe "#createUser" do
      it "returns no name" do
        user = User.new

        user.name.should == ""
      end
    end
  end
end
