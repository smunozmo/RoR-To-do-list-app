require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get tasks' do
    get users_tasks_url
    assert_response :success
  end
end
