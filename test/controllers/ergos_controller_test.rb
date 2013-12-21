require 'test_helper'

class ErgosControllerTest < ActionController::TestCase
  setup do
    @ergo = ergos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ergos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ergo" do
    assert_difference('Ergo.count') do
      post :create, ergo: { description: @ergo.description, score: @ergo.score }
    end

    assert_redirected_to ergo_path(assigns(:ergo))
  end

  test "should show ergo" do
    get :show, id: @ergo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ergo
    assert_response :success
  end

  test "should update ergo" do
    patch :update, id: @ergo, ergo: { description: @ergo.description, score: @ergo.score }
    assert_redirected_to ergo_path(assigns(:ergo))
  end

  test "should destroy ergo" do
    assert_difference('Ergo.count', -1) do
      delete :destroy, id: @ergo
    end

    assert_redirected_to ergos_path
  end
end
