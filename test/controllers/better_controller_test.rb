require 'test_helper'

class BetterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get better_index_url
    assert_response :success
  end

  test "should get show" do
    get better_show_url
    assert_response :success
  end

end
