require "test_helper"

class EndUser::ParksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get end_user_parks_new_url
    assert_response :success
  end

  test "should get show" do
    get end_user_parks_show_url
    assert_response :success
  end

  test "should get index" do
    get end_user_parks_index_url
    assert_response :success
  end

  test "should get edit" do
    get end_user_parks_edit_url
    assert_response :success
  end
end
