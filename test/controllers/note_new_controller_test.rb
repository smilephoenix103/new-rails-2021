require "test_helper"

class NoteNewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get note_new_index_url
    assert_response :success
  end
end
