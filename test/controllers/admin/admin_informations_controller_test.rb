require "test_helper"

class Admin::AdminInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_admin_informations_index_url
    assert_response :success
  end
end
