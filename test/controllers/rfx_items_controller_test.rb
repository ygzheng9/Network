require 'test_helper'

class RfxItemsControllerTest < ActionController::TestCase
  setup do
    @rfx_item = rfx_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rfx_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rfx_item" do
    assert_difference('RfxItem.count') do
      post :create, rfx_item: { Rfx_id: @rfx_item.Rfx_id, material_id: @rfx_item.material_id, plant_id: @rfx_item.plant_id, quantity: @rfx_item.quantity, required_dt: @rfx_item.required_dt }
    end

    assert_redirected_to rfx_item_path(assigns(:rfx_item))
  end

  test "should show rfx_item" do
    get :show, id: @rfx_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rfx_item
    assert_response :success
  end

  test "should update rfx_item" do
    patch :update, id: @rfx_item, rfx_item: { Rfx_id: @rfx_item.Rfx_id, material_id: @rfx_item.material_id, plant_id: @rfx_item.plant_id, quantity: @rfx_item.quantity, required_dt: @rfx_item.required_dt }
    assert_redirected_to rfx_item_path(assigns(:rfx_item))
  end

  test "should destroy rfx_item" do
    assert_difference('RfxItem.count', -1) do
      delete :destroy, id: @rfx_item
    end

    assert_redirected_to rfx_items_path
  end
end
