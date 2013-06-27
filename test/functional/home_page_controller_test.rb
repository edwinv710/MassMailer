require 'test_helper'

class HomePageControllerTest < ActionController::TestCase
  test "should get SendMail" do
    get :SendMail
    assert_response :success
  end

end
