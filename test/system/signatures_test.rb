require "application_system_test_case"

class SignaturesTest < ApplicationSystemTestCase
  setup do
    @signature = signatures(:one)
  end

  test "visiting the index" do
    visit signatures_url
    assert_selector "h1", text: "Signatures"
  end

  test "creating a Signature" do
    visit signatures_url
    click_on "New Signature"

    fill_in "Description", with: @signature.description
    fill_in "Short name", with: @signature.short_name
    fill_in "Signature cod", with: @signature.signature_cod
    click_on "Create Signature"

    assert_text "Signature was successfully created"
    click_on "Back"
  end

  test "updating a Signature" do
    visit signatures_url
    click_on "Edit", match: :first

    fill_in "Description", with: @signature.description
    fill_in "Short name", with: @signature.short_name
    fill_in "Signature cod", with: @signature.signature_cod
    click_on "Update Signature"

    assert_text "Signature was successfully updated"
    click_on "Back"
  end

  test "destroying a Signature" do
    visit signatures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Signature was successfully destroyed"
  end
end
