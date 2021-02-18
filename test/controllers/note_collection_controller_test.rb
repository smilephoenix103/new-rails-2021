require "test_helper"

class NoteCollectionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get note_collection_index_url
    assert_response :success
  end
end
