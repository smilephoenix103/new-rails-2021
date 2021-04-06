require "application_system_test_case"

class BoughtsTest < ApplicationSystemTestCase
  setup do
    @bought = boughts(:one)
  end

  test "visiting the index" do
    visit boughts_url
    assert_selector "h1", text: "Boughts"
  end

  test "creating a Bought" do
    visit boughts_url
    click_on "New Bought"

    fill_in "Description", with: @bought.description
    fill_in "Full name", with: @bought.full_name
    fill_in "Name", with: @bought.name
    click_on "Create Bought"

    assert_text "Bought was successfully created"
    click_on "Back"
  end

  test "updating a Bought" do
    visit boughts_url
    click_on "Edit", match: :first

    fill_in "Description", with: @bought.description
    fill_in "Full name", with: @bought.full_name
    fill_in "Name", with: @bought.name
    click_on "Update Bought"

    assert_text "Bought was successfully updated"
    click_on "Back"
  end

  test "destroying a Bought" do
    visit boughts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bought was successfully destroyed"
  end
end
