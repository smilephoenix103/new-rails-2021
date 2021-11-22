require "test_helper"

class GoldapiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get goldapi_index_url
    assert_response :success
  end
end
