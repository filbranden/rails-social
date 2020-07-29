require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "redirects anonymous users to login" do
    get root_url
    assert_redirected_to login_url
  end

  def login_as(user, password)
    post sessions_url, params: { email: user.email, password: password }
    assert_redirected_to root_url
  end

  test "get posts for authenticated users" do
    user1 = users(:user1)

    login_as user1, 'password'

    get root_url
    assert_response :success
  end
end
