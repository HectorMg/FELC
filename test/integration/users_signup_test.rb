require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "", email: "user@invalid", password: "foo", password_confirmation: "bar"}
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count' do
      post_via_redirect users_path, user: {name: "Foo Bar", email: "user@example.org", password: "123456", password_confirmation: "123456"}
    end
    assert_template 'users/show'
    assert_not flash.empty?
  end
end
