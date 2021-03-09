require "test_helper"

class CoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coin = coins(:one)
  end

  test "should get index" do
    get coins_url
    assert_response :success
  end

  test "should get new" do
    get new_coin_url
    assert_response :success
  end

  test "should create coin" do
    assert_difference('Coin.count') do
      post coins_url, params: { coin: { avers_path: @coin.avers_path, bought: @coin.bought, coin_date: @coin.coin_date, composition: @coin.composition, currency_id: @coin.currency_id, date_buy: @coin.date_buy, denomination: @coin.denomination, description: @coin.description, diameter: @coin.diameter, img_type: @coin.img_type, name_currency: @coin.name_currency, price_buy: @coin.price_buy, price_sell: @coin.price_sell, quality: @coin.quality, quantity: @coin.quantity, reverse_path: @coin.reverse_path, series: @coin.series, signature_code: @coin.signature_code, status: @coin.status, status_sell: @coin.status_sell, thickness: @coin.thickness, weight: @coin.weight } }
    end

    assert_redirected_to coin_url(Coin.last)
  end

  test "should show coin" do
    get coin_url(@coin)
    assert_response :success
  end

  test "should get edit" do
    get edit_coin_url(@coin)
    assert_response :success
  end

  test "should update coin" do
    patch coin_url(@coin), params: { coin: { avers_path: @coin.avers_path, bought: @coin.bought, coin_date: @coin.coin_date, composition: @coin.composition, currency_id: @coin.currency_id, date_buy: @coin.date_buy, denomination: @coin.denomination, description: @coin.description, diameter: @coin.diameter, img_type: @coin.img_type, name_currency: @coin.name_currency, price_buy: @coin.price_buy, price_sell: @coin.price_sell, quality: @coin.quality, quantity: @coin.quantity, reverse_path: @coin.reverse_path, series: @coin.series, signature_code: @coin.signature_code, status: @coin.status, status_sell: @coin.status_sell, thickness: @coin.thickness, weight: @coin.weight } }
    assert_redirected_to coin_url(@coin)
  end

  test "should destroy coin" do
    assert_difference('Coin.count', -1) do
      delete coin_url(@coin)
    end

    assert_redirected_to coins_url
  end
end
