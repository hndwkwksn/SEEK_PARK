require "test_helper"

class EndUser::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get end_user_tags_show_url
    assert_response :success
  end
end
