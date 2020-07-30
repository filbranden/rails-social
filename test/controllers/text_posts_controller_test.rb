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

  test "should create post" do
    user1 = users(:user1)
    login_as user1, 'password'

    post text_posts_url, params: {
      text_post: {
        title: "Test Title",
        body: "Test Body"
      }
    }

    post = Post.last
    assert_equal "Test Title", post.title
    assert_equal "Test Body", post.body
    assert_equal user1.id, post.user_id
    assert_redirected_to post_url(post)
  end
end
