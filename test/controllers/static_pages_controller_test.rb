require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | Free Enterprise Leadership Challenge"
  end

  test "should get company" do
    get :company
    assert_response :success
    assert_select "title", "Companies | Free Enterprise Leadership Challenge"
  end

  test "should get schedule" do
    get :schedule
    assert_response :success
    assert_select "title", "Schedule | Free Enterprise Leadership Challenge"
  end

  test "should get manual" do
    get :manual
    assert_response :success
    assert_select "title", "Manual | Free Enterprise Leadership Challenge"
  end

end
