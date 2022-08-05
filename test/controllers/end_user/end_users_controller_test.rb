require "test_helper"

class EndUser::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get end_user_end_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get end_user_end_users_edit_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get end_user_end_users_unsubscribe_url
    assert_response :success
  end
end
