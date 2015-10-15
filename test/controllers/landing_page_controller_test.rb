require 'test_helper'

class LandingPageControllerTest < ActionController::TestCase

  def setup
    @base_title = "Free Enterprise Leadership Challenge"
  end

  test "should get landing" do
    get :landing
    assert_response :success
    assert_select "title",  "#{@base_title}"
  end

end
