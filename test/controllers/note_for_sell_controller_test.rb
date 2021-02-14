require "test_helper"

class NoteForSellControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get note_for_sell_index_url
    assert_response :success
  end
end
