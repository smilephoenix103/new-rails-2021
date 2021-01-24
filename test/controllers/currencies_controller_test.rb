require "test_helper"

class CurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency = currencies(:one)
  end

  test "should get index" do
    get currencies_url
    assert_response :success
  end

  test "should get new" do
    get new_currency_url
    assert_response :success
  end

  test "should create currency" do
    assert_difference('Currency.count') do
      post currencies_url, params: { currency: { active: @currency.active, change: @currency.change, cod: @currency.cod, converter: @currency.converter, country_id: @currency.country_id, currency: @currency.currency, currency_from: @currency.currency_from, data_exchange: @currency.data_exchange, description: @currency.description } }
    end

    assert_redirected_to currency_url(Currency.last)
  end

  test "should show currency" do
    get currency_url(@currency)
    assert_response :success
  end

  test "should get edit" do
    get edit_currency_url(@currency)
    assert_response :success
  end

  test "should update currency" do
    patch currency_url(@currency), params: { currency: { active: @currency.active, change: @currency.change, cod: @currency.cod, converter: @currency.converter, country_id: @currency.country_id, currency: @currency.currency, currency_from: @currency.currency_from, data_exchange: @currency.data_exchange, description: @currency.description } }
    assert_redirected_to currency_url(@currency)
  end

  test "should destroy currency" do
    assert_difference('Currency.count', -1) do
      delete currency_url(@currency)
    end

    assert_redirected_to currencies_url
  end
end
