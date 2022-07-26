require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get tasks" do
    get user_tasks_url
    assert_response :success
  end
end
