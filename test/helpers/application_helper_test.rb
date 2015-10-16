require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Free Enterprise Leadership Challenge"
    assert_equal full_title("Help"), "Help | Free Enterprise Leadership Challenge"
  end
end
