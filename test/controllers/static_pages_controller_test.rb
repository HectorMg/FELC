require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = "Free Enterprise Leadership Challenge"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get company" do
    get :company
    assert_response :success
    assert_select "title", "Companies | #{@base_title}"
  end

  test "should get schedule" do
    get :schedule
    assert_response :success
    assert_select "title", "Schedule | #{@base_title}"
  end

  test "should get manual" do
    get :manual
    assert_response :success
    assert_select "title", "Manual | #{@base_title}"
  end

end
