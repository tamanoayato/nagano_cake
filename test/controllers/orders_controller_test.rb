require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get orders_new_url
    assert_response :success
  end

  test "should get thanks" do
    get orders_thanks_url
    assert_response :success
  end

  test "should get idex" do
    get orders_idex_url
    assert_response :success
  end

  test "should get show" do
    get orders_show_url
    assert_response :success
  end
end
