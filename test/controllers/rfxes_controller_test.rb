require 'test_helper'

class RfxesControllerTest < ActionController::TestCase
  setup do
    @rfx = rfxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rfxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rfx" do
    assert_difference('Rfx.count') do
      post :create, rfx: { SN: @rfx.SN, begin_dt: @rfx.begin_dt, end_dt: @rfx.end_dt, sourcing_org_id: @rfx.sourcing_org_id }
    end

    assert_redirected_to rfx_path(assigns(:rfx))
  end

  test "should show rfx" do
    get :show, id: @rfx
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rfx
    assert_response :success
  end

  test "should update rfx" do
    patch :update, id: @rfx, rfx: { SN: @rfx.SN, begin_dt: @rfx.begin_dt, end_dt: @rfx.end_dt, sourcing_org_id: @rfx.sourcing_org_id }
    assert_redirected_to rfx_path(assigns(:rfx))
  end

  test "should destroy rfx" do
    assert_difference('Rfx.count', -1) do
      delete :destroy, id: @rfx
    end

    assert_redirected_to rfxes_path
  end
end
