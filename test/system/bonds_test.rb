require "application_system_test_case"

class BondsTest < ApplicationSystemTestCase
  setup do
    @bond = bonds(:one)
  end

  test "visiting the index" do
    visit bonds_url
    assert_selector "h1", text: "Bonds"
  end

  test "creating a Bond" do
    visit bonds_url
    click_on "New Bond"

    fill_in "Avers path", with: @bond.avers_path
    fill_in "Bond date", with: @bond.bond_date
    fill_in "Bought", with: @bond.bought
    fill_in "Currency", with: @bond.currency_id
    fill_in "Date buy", with: @bond.date_buy
    fill_in "Denomination", with: @bond.denomination
    fill_in "Description", with: @bond.description
    fill_in "Image type", with: @bond.image_type
    fill_in "Making", with: @bond.making
    fill_in "Name currency", with: @bond.name_currency
    fill_in "Price buy", with: @bond.price_buy
    fill_in "Price sell", with: @bond.price_sell
    fill_in "Quality", with: @bond.quality
    fill_in "Quantity", with: @bond.quantity
    fill_in "Reverse path", with: @bond.reverse_path
    fill_in "Series", with: @bond.series
    fill_in "Signature code", with: @bond.signature_code
    fill_in "Status", with: @bond.status
    fill_in "Status sell", with: @bond.status_sell
    click_on "Create Bond"

    assert_text "Bond was successfully created"
    click_on "Back"
  end

  test "updating a Bond" do
    visit bonds_url
    click_on "Edit", match: :first

    fill_in "Avers path", with: @bond.avers_path
    fill_in "Bond date", with: @bond.bond_date
    fill_in "Bought", with: @bond.bought
    fill_in "Currency", with: @bond.currency_id
    fill_in "Date buy", with: @bond.date_buy
    fill_in "Denomination", with: @bond.denomination
    fill_in "Description", with: @bond.description
    fill_in "Image type", with: @bond.image_type
    fill_in "Making", with: @bond.making
    fill_in "Name currency", with: @bond.name_currency
    fill_in "Price buy", with: @bond.price_buy
    fill_in "Price sell", with: @bond.price_sell
    fill_in "Quality", with: @bond.quality
    fill_in "Quantity", with: @bond.quantity
    fill_in "Reverse path", with: @bond.reverse_path
    fill_in "Series", with: @bond.series
    fill_in "Signature code", with: @bond.signature_code
    fill_in "Status", with: @bond.status
    fill_in "Status sell", with: @bond.status_sell
    click_on "Update Bond"

    assert_text "Bond was successfully updated"
    click_on "Back"
  end

  test "destroying a Bond" do
    visit bonds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bond was successfully destroyed"
  end
end
