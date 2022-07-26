require "test_helper"

class WillUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get will_users_index_url
    assert_response :success
  end

  test "should get new" do
    get will_users_new_url
    assert_response :success
  end
end
