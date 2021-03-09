require "application_system_test_case"

class CoinsTest < ApplicationSystemTestCase
  setup do
    @coin = coins(:one)
  end

  test "visiting the index" do
    visit coins_url
    assert_selector "h1", text: "Coins"
  end

  test "creating a Coin" do
    visit coins_url
    click_on "New Coin"

    fill_in "Avers path", with: @coin.avers_path
    fill_in "Bought", with: @coin.bought
    fill_in "Coin date", with: @coin.coin_date
    fill_in "Composition", with: @coin.composition
    fill_in "Currency", with: @coin.currency_id
    fill_in "Date buy", with: @coin.date_buy
    fill_in "Denomination", with: @coin.denomination
    fill_in "Description", with: @coin.description
    fill_in "Diameter", with: @coin.diameter
    fill_in "Img type", with: @coin.img_type
    fill_in "Name currency", with: @coin.name_currency
    fill_in "Price buy", with: @coin.price_buy
    fill_in "Price sell", with: @coin.price_sell
    fill_in "Quality", with: @coin.quality
    fill_in "Quantity", with: @coin.quantity
    fill_in "Reverse path", with: @coin.reverse_path
    fill_in "Series", with: @coin.series
    fill_in "Signature code", with: @coin.signature_code
    fill_in "Status", with: @coin.status
    fill_in "Status sell", with: @coin.status_sell
    fill_in "Thickness", with: @coin.thickness
    fill_in "Weight", with: @coin.weight
    click_on "Create Coin"

    assert_text "Coin was successfully created"
    click_on "Back"
  end

  test "updating a Coin" do
    visit coins_url
    click_on "Edit", match: :first

    fill_in "Avers path", with: @coin.avers_path
    fill_in "Bought", with: @coin.bought
    fill_in "Coin date", with: @coin.coin_date
    fill_in "Composition", with: @coin.composition
    fill_in "Currency", with: @coin.currency_id
    fill_in "Date buy", with: @coin.date_buy
    fill_in "Denomination", with: @coin.denomination
    fill_in "Description", with: @coin.description
    fill_in "Diameter", with: @coin.diameter
    fill_in "Img type", with: @coin.img_type
    fill_in "Name currency", with: @coin.name_currency
    fill_in "Price buy", with: @coin.price_buy
    fill_in "Price sell", with: @coin.price_sell
    fill_in "Quality", with: @coin.quality
    fill_in "Quantity", with: @coin.quantity
    fill_in "Reverse path", with: @coin.reverse_path
    fill_in "Series", with: @coin.series
    fill_in "Signature code", with: @coin.signature_code
    fill_in "Status", with: @coin.status
    fill_in "Status sell", with: @coin.status_sell
    fill_in "Thickness", with: @coin.thickness
    fill_in "Weight", with: @coin.weight
    click_on "Update Coin"

    assert_text "Coin was successfully updated"
    click_on "Back"
  end

  test "destroying a Coin" do
    visit coins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coin was successfully destroyed"
  end
end
