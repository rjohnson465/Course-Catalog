require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get static_pages_signup_url
    assert_response :success
  end

end
