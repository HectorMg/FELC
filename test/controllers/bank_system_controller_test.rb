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

end
