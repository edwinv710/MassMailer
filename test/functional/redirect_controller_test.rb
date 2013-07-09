require 'test_helper'

class RedirectControllerTest < ActionController::TestCase
  test "should get direct" do
    get :direct
    assert_response :success
  end

end
