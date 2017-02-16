require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get scoreboard" do
    get :scoreboard
    assert_response :success
  end

end
