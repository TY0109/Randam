require "test_helper"

class WillusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get willusers_index_url
    assert_response :success
  end

  test "should get new" do
    get willusers_new_url
    assert_response :success
  end
end
