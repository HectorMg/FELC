require 'test_helper'

class UserBankControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get stock" do
    get :stock
    assert_response :success
  end

end
