require "test_helper"

class BoughtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bought = boughts(:one)
  end

  test "should get index" do
    get boughts_url
    assert_response :success
  end

  test "should get new" do
    get new_bought_url
    assert_response :success
  end

  test "should create bought" do
    assert_difference('Bought.count') do
      post boughts_url, params: { bought: { description: @bought.description, full_name: @bought.full_name, name: @bought.name } }
    end

    assert_redirected_to bought_url(Bought.last)
  end

  test "should show bought" do
    get bought_url(@bought)
    assert_response :success
  end

  test "should get edit" do
    get edit_bought_url(@bought)
    assert_response :success
  end

  test "should update bought" do
    patch bought_url(@bought), params: { bought: { description: @bought.description, full_name: @bought.full_name, name: @bought.name } }
    assert_redirected_to bought_url(@bought)
  end

  test "should destroy bought" do
    assert_difference('Bought.count', -1) do
      delete bought_url(@bought)
    end

    assert_redirected_to boughts_url
  end
end
