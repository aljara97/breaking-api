require 'test_helper'

class BreakingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get breaking_index_url
    assert_response :success
  end

  test "should get show" do
    get breaking_show_url
    assert_response :success
  end

end
