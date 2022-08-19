require "test_helper"

class EndUser::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_user_tags_index_url
    assert_response :success
  end
end
