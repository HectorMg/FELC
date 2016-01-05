require 'test_helper'

class BankSystemControllerTest < ActionController::TestCase

  def setup
    @base_title = "Free Enterprise Leadership Challenge"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", "Bank | #{@base_title}"
  end

  test "should get transactions" do
    get :transactions
    assert_response :success
    assert_select "title", "Transactions | #{@base_title}"
  end

  test "should get properties" do
    get :properties
    assert_response :success
    assert_select "title", "Properties | #{@base_title}"
  end

end
