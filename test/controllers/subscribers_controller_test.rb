require "test_helper"

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get subscribers_welcome_url
    assert_response :success
  end
end
