require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do

    get root_path
    assert_template 'landing_page/landing'
    assert_select "a[href=?]", home_path, count: 2
    assert_select "a[href=?]", signup_path

    get home_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", home_path, count: 2
    assert_select "a[href=?]", teams_path
    assert_select "a[href=?]", schedule_path
    assert_select "a[href=?]", manual_path

    get signup_path
    assert_template 'users/new'
    assert_select "a[href=?]", home_path
    assert_select "a[href=?]", signup_path
    assert_select 'title', full_title("Sign Up")
  end
end
