require 'test_helper'

class TextPostsControllerTest < ActionDispatch::IntegrationTest
  def login_as(user, password)
    post sessions_url, params: { email: user.email, password: password }
    assert_redirected_to root_url
  end

  test "get new with new post" do
    user1 = users(:user1)
    login_as user1, 'password'

    get new_text_post_url
    assert_response :success
  end
end
