require "test_helper"

class Api::BoardsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_boards_create_url
    assert_response :success
  end

  test "should get delete" do
    get api_boards_delete_url
    assert_response :success
  end
end
