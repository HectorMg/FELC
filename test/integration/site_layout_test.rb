require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get home_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", home_path
    assert_select "a[href=?]", company_path
    assert_select "a[href=?]", schedule_path
    assert_select "a[href=?]", manual_path
  end
end
