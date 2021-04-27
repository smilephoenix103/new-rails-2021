require "test_helper"

class CoinNewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coin_new_index_url
    assert_response :success
  end
end
