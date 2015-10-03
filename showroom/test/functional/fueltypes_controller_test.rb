require 'test_helper'

class FueltypesControllerTest < ActionController::TestCase
  setup do
    @fueltype = fueltypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fueltypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fueltype" do
    assert_difference('Fueltype.count') do
      post :create, fueltype: { fuel_type: @fueltype.fuel_type }
    end

    assert_redirected_to fueltype_path(assigns(:fueltype))
  end

  test "should show fueltype" do
    get :show, id: @fueltype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fueltype
    assert_response :success
  end

  test "should update fueltype" do
    put :update, id: @fueltype, fueltype: { fuel_type: @fueltype.fuel_type }
    assert_redirected_to fueltype_path(assigns(:fueltype))
  end

  test "should destroy fueltype" do
    assert_difference('Fueltype.count', -1) do
      delete :destroy, id: @fueltype
    end

    assert_redirected_to fueltypes_path
  end
end
