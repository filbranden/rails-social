require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  test "user login, browse and logout" do
    user = users(:user1)

    get '/login'
    assert_response :success

    post '/sessions', params: {
      email: user.email,
      password: 'password'
    }
    follow_redirect!
    assert_response :success
    assert_equal '/', path

    get '/logout'
    follow_redirect!
    assert_equal '/', path
    follow_redirect!
    assert_response :success
    assert_equal '/login', path
  end
end
