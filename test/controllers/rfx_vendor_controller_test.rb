require 'test_helper'

class RfxVendorControllerTest < ActionController::TestCase
  test "should get create_update" do
    get :create_update
    assert_response :success
  end

end
