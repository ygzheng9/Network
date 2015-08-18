require 'test_helper'

class SourcingOrgsControllerTest < ActionController::TestCase
  setup do
    @sourcing_org = sourcing_orgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sourcing_orgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sourcing_org" do
    assert_difference('SourcingOrg.count') do
      post :create, sourcing_org: { code: @sourcing_org.code, desc: @sourcing_org.desc }
    end

    assert_redirected_to sourcing_org_path(assigns(:sourcing_org))
  end

  test "should show sourcing_org" do
    get :show, id: @sourcing_org
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sourcing_org
    assert_response :success
  end

  test "should update sourcing_org" do
    patch :update, id: @sourcing_org, sourcing_org: { code: @sourcing_org.code, desc: @sourcing_org.desc }
    assert_redirected_to sourcing_org_path(assigns(:sourcing_org))
  end

  test "should destroy sourcing_org" do
    assert_difference('SourcingOrg.count', -1) do
      delete :destroy, id: @sourcing_org
    end

    assert_redirected_to sourcing_orgs_path
  end
end
