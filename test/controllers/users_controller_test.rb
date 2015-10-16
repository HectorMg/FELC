require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @base_title = "Free Enterprise Leadership Challenge"
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

end
