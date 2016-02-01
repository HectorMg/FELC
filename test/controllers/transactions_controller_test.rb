require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase

  test "should get new_contract" do
    get :new_contract
    assert_response :success
  end

  test "should get new_copyright" do
    get :new_copyright
    assert_response :success
  end

  test "should get stock_purchase" do
    get :stock_purchase
    assert_response :success
  end

  test "should get stock_sale" do
    get :stock_sale
    assert_response :success
  end

  test "should get deposit" do
    get :deposit
    assert_response :success
  end

  test "should get withdraw" do
    get :withdraw
    assert_response :success
  end

end
