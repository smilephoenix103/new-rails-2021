require "test_helper"

class BondsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bond = bonds(:one)
  end

  test "should get index" do
    get bonds_url
    assert_response :success
  end

  test "should get new" do
    get new_bond_url
    assert_response :success
  end

  test "should create bond" do
    assert_difference('Bond.count') do
      post bonds_url, params: { bond: { avers_path: @bond.avers_path, bond_date: @bond.bond_date, bought: @bond.bought, currency_id: @bond.currency_id, date_buy: @bond.date_buy, denomination: @bond.denomination, description: @bond.description, image_type: @bond.image_type, making: @bond.making, name_currency: @bond.name_currency, price_buy: @bond.price_buy, price_sell: @bond.price_sell, quality: @bond.quality, quantity: @bond.quantity, reverse_path: @bond.reverse_path, series: @bond.series, signature_code: @bond.signature_code, status: @bond.status, status_sell: @bond.status_sell } }
    end

    assert_redirected_to bond_url(Bond.last)
  end

  test "should show bond" do
    get bond_url(@bond)
    assert_response :success
  end

  test "should get edit" do
    get edit_bond_url(@bond)
    assert_response :success
  end

  test "should update bond" do
    patch bond_url(@bond), params: { bond: { avers_path: @bond.avers_path, bond_date: @bond.bond_date, bought: @bond.bought, currency_id: @bond.currency_id, date_buy: @bond.date_buy, denomination: @bond.denomination, description: @bond.description, image_type: @bond.image_type, making: @bond.making, name_currency: @bond.name_currency, price_buy: @bond.price_buy, price_sell: @bond.price_sell, quality: @bond.quality, quantity: @bond.quantity, reverse_path: @bond.reverse_path, series: @bond.series, signature_code: @bond.signature_code, status: @bond.status, status_sell: @bond.status_sell } }
    assert_redirected_to bond_url(@bond)
  end

  test "should destroy bond" do
    assert_difference('Bond.count', -1) do
      delete bond_url(@bond)
    end

    assert_redirected_to bonds_url
  end
end
