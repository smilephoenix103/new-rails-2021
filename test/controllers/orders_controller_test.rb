require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { customer_id: @order.customer_id, description: @order.description, order_date: @order.order_date, order_date_send: @order.order_date_send, order_number: @order.order_number, order_status: @order.order_status, shipment_cost: @order.shipment_cost, shipment_type: @order.shipment_type, tracking_number: @order.tracking_number } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { customer_id: @order.customer_id, description: @order.description, order_date: @order.order_date, order_date_send: @order.order_date_send, order_number: @order.order_number, order_status: @order.order_status, shipment_cost: @order.shipment_cost, shipment_type: @order.shipment_type, tracking_number: @order.tracking_number } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
