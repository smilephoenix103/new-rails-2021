require "application_system_test_case"

class NotesTest < ApplicationSystemTestCase
  setup do
    @note = notes(:one)
  end

  test "visiting the index" do
    visit notes_url
    assert_selector "h1", text: "Notes"
  end

  test "creating a Note" do
    visit notes_url
    click_on "New Note"

    fill_in "Avers path", with: @note.avers_path
    fill_in "Currency", with: @note.currency_id
    fill_in "Denomination", with: @note.denomination
    fill_in "Description", with: @note.description
    fill_in "Img type", with: @note.img_type
    fill_in "Name currency", with: @note.name_currency
    fill_in "Note date", with: @note.note_date
    fill_in "Price buy", with: @note.price_buy
    fill_in "Price sell", with: @note.price_sell
    fill_in "Quality", with: @note.quality
    fill_in "Quantity", with: @note.quantity
    fill_in "Reverse path", with: @note.reverse_path
    fill_in "Signature code", with: @note.signature_code
    fill_in "Status", with: @note.status
    click_on "Create Note"

    assert_text "Note was successfully created"
    click_on "Back"
  end

  test "updating a Note" do
    visit notes_url
    click_on "Edit", match: :first

    fill_in "Avers path", with: @note.avers_path
    fill_in "Currency", with: @note.currency_id
    fill_in "Denomination", with: @note.denomination
    fill_in "Description", with: @note.description
    fill_in "Img type", with: @note.img_type
    fill_in "Name currency", with: @note.name_currency
    fill_in "Note date", with: @note.note_date
    fill_in "Price buy", with: @note.price_buy
    fill_in "Price sell", with: @note.price_sell
    fill_in "Quality", with: @note.quality
    fill_in "Quantity", with: @note.quantity
    fill_in "Reverse path", with: @note.reverse_path
    fill_in "Signature code", with: @note.signature_code
    fill_in "Status", with: @note.status
    click_on "Update Note"

    assert_text "Note was successfully updated"
    click_on "Back"
  end

  test "destroying a Note" do
    visit notes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Note was successfully destroyed"
  end
end
