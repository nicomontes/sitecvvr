require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get utils" do
    get static_pages_utils_url
    assert_response :success
  end

end
