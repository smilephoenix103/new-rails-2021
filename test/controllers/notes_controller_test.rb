require "test_helper"

class NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @note = notes(:one)
  end

  test "should get index" do
    get notes_url
    assert_response :success
  end

  test "should get new" do
    get new_note_url
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post notes_url, params: { note: { avers_path: @note.avers_path, currency_id: @note.currency_id, denomination: @note.denomination, description: @note.description, img_type: @note.img_type, name_currency: @note.name_currency, note_date: @note.note_date, price_buy: @note.price_buy, price_sell: @note.price_sell, quality: @note.quality, quantity: @note.quantity, reverse_path: @note.reverse_path, signature_code: @note.signature_code, status: @note.status } }
    end

    assert_redirected_to note_url(Note.last)
  end

  test "should show note" do
    get note_url(@note)
    assert_response :success
  end

  test "should get edit" do
    get edit_note_url(@note)
    assert_response :success
  end

  test "should update note" do
    patch note_url(@note), params: { note: { avers_path: @note.avers_path, currency_id: @note.currency_id, denomination: @note.denomination, description: @note.description, img_type: @note.img_type, name_currency: @note.name_currency, note_date: @note.note_date, price_buy: @note.price_buy, price_sell: @note.price_sell, quality: @note.quality, quantity: @note.quantity, reverse_path: @note.reverse_path, signature_code: @note.signature_code, status: @note.status } }
    assert_redirected_to note_url(@note)
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete note_url(@note)
    end

    assert_redirected_to notes_url
  end
end
