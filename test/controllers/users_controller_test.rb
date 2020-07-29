require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "redirects anonymous users to login" do
    get root_url
    assert_redirected_to login_url
  end
end
