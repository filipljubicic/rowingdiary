require 'test_helper'

class WatersControllerTest < ActionController::TestCase
  setup do
    @water = waters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:waters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create water" do
    assert_difference('Water.count') do
      post :create, water: { BoatType: @water.BoatType, SessionDescription: @water.SessionDescription, crew: @water.crew, distance: @water.distance, notes: @water.notes }
    end

    assert_redirected_to water_path(assigns(:water))
  end

  test "should show water" do
    get :show, id: @water
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @water
    assert_response :success
  end

  test "should update water" do
    patch :update, id: @water, water: { BoatType: @water.BoatType, SessionDescription: @water.SessionDescription, crew: @water.crew, distance: @water.distance, notes: @water.notes }
    assert_redirected_to water_path(assigns(:water))
  end

  test "should destroy water" do
    assert_difference('Water.count', -1) do
      delete :destroy, id: @water
    end

    assert_redirected_to waters_path
  end
end
