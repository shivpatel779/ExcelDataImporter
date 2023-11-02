require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get import" do
    get users_import_url
    assert_response :success
  end

  test "should get display" do
    get users_display_url
    assert_response :success
  end
end
