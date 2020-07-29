require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "saves with valid attributes" do
    user = User.new(
      email: "user@example.com",
      password: "password",
      password_confirmation: "password"
    )
    assert user.save
  end

  test "validates email presence" do
    @user1 = users(:user1)
    @user1.email = nil

    assert_not @user1.valid?
  end
end
