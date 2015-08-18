require 'test_helper'

class RfxRoundsControllerTest < ActionController::TestCase
  setup do
    @rfx_round = rfx_rounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rfx_rounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rfx_round" do
    assert_difference('RfxRound.count') do
      post :create, rfx_round: { end_dt: @rfx_round.end_dt, rfx_id: @rfx_round.rfx_id, start_dt: @rfx_round.start_dt }
    end

    assert_redirected_to rfx_round_path(assigns(:rfx_round))
  end

  test "should show rfx_round" do
    get :show, id: @rfx_round
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rfx_round
    assert_response :success
  end

  test "should update rfx_round" do
    patch :update, id: @rfx_round, rfx_round: { end_dt: @rfx_round.end_dt, rfx_id: @rfx_round.rfx_id, start_dt: @rfx_round.start_dt }
    assert_redirected_to rfx_round_path(assigns(:rfx_round))
  end

  test "should destroy rfx_round" do
    assert_difference('RfxRound.count', -1) do
      delete :destroy, id: @rfx_round
    end

    assert_redirected_to rfx_rounds_path
  end
end
