require "test_helper"

class Admin::ParksControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_parks_edit_url
    assert_response :success
  end
end
