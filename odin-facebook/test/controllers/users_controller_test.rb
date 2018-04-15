require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get newsfeed" do
    get users_newsfeed_url
    assert_response :success
  end

end
