require 'test_helper'

class HashtagControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hashtag_new_url
    assert_response :success
  end

end
