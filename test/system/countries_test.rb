require "application_system_test_case"

class CountriesTest < ApplicationSystemTestCase
  setup do
    @country = countries(:one)
  end

  test "visiting the index" do
    visit countries_url
    assert_selector "h1", text: "Countries"
  end

  test "creating a Country" do
    visit countries_url
    click_on "New Country"

    fill_in "Alfa 2", with: @country.alfa_2
    fill_in "Alfa 3", with: @country.alfa_3
    fill_in "Capital city", with: @country.capital_city
    fill_in "Continent", with: @country.continent
    fill_in "Country en", with: @country.country_en
    fill_in "Country pl", with: @country.country_pl
    fill_in "Iso code", with: @country.iso_code
    fill_in "Numeric code", with: @country.numeric_code
    click_on "Create Country"

    assert_text "Country was successfully created"
    click_on "Back"
  end

  test "updating a Country" do
    visit countries_url
    click_on "Edit", match: :first

    fill_in "Alfa 2", with: @country.alfa_2
    fill_in "Alfa 3", with: @country.alfa_3
    fill_in "Capital city", with: @country.capital_city
    fill_in "Continent", with: @country.continent
    fill_in "Country en", with: @country.country_en
    fill_in "Country pl", with: @country.country_pl
    fill_in "Iso code", with: @country.iso_code
    fill_in "Numeric code", with: @country.numeric_code
    click_on "Update Country"

    assert_text "Country was successfully updated"
    click_on "Back"
  end

  test "destroying a Country" do
    visit countries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Country was successfully destroyed"
  end
end
