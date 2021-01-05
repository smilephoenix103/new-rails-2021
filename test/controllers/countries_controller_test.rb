require "test_helper"

class CountriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country = countries(:one)
  end

  test "should get index" do
    get countries_url
    assert_response :success
  end

  test "should get new" do
    get new_country_url
    assert_response :success
  end

  test "should create country" do
    assert_difference('Country.count') do
      post countries_url, params: { country: { alfa_2: @country.alfa_2, alfa_3: @country.alfa_3, capital_city: @country.capital_city, continent: @country.continent, country_en: @country.country_en, country_pl: @country.country_pl, iso_code: @country.iso_code, numeric_code: @country.numeric_code } }
    end

    assert_redirected_to country_url(Country.last)
  end

  test "should show country" do
    get country_url(@country)
    assert_response :success
  end

  test "should get edit" do
    get edit_country_url(@country)
    assert_response :success
  end

  test "should update country" do
    patch country_url(@country), params: { country: { alfa_2: @country.alfa_2, alfa_3: @country.alfa_3, capital_city: @country.capital_city, continent: @country.continent, country_en: @country.country_en, country_pl: @country.country_pl, iso_code: @country.iso_code, numeric_code: @country.numeric_code } }
    assert_redirected_to country_url(@country)
  end

  test "should destroy country" do
    assert_difference('Country.count', -1) do
      delete country_url(@country)
    end

    assert_redirected_to countries_url
  end
end
