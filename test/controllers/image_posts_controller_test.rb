require 'test_helper'

class ImagePostsControllerTest < ActionDispatch::IntegrationTest
  def login_as(user, password)
    post sessions_url, params: { email: user.email, password: password }
    assert_redirected_to root_url
  end

  test "get new with new post" do
    user1 = users(:user1)
    login_as user1, 'password'

    get new_image_post_url
    assert_response :success
  end

  test "should create post" do
    user1 = users(:user1)
    login_as user1, 'password'

    post image_posts_url, params: {
      image_post: {
        title: "Test Image Title",
        url: "http://img.example.com/test.jpg"
      }
    }

    post = Post.last
    assert_equal "Test Image Title", post.title
    assert_equal "http://img.example.com/test.jpg", post.url
    assert_nil post.body
    assert_equal user1.id, post.user_id
    assert_redirected_to post_url(post)
  end
end
