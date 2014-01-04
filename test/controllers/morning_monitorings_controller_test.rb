require 'test_helper'

class MorningMonitoringsControllerTest < ActionController::TestCase
  setup do
    @morning_monitoring = morning_monitorings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:morning_monitorings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create morning_monitoring" do
    assert_difference('MorningMonitoring.count') do
      post :create, morning_monitoring: { hr: @morning_monitoring.hr, notes: @morning_monitoring.notes, sleep: @morning_monitoring.sleep }
    end

    assert_redirected_to morning_monitoring_path(assigns(:morning_monitoring))
  end

  test "should show morning_monitoring" do
    get :show, id: @morning_monitoring
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @morning_monitoring
    assert_response :success
  end

  test "should update morning_monitoring" do
    patch :update, id: @morning_monitoring, morning_monitoring: { hr: @morning_monitoring.hr, notes: @morning_monitoring.notes, sleep: @morning_monitoring.sleep }
    assert_redirected_to morning_monitoring_path(assigns(:morning_monitoring))
  end

  test "should destroy morning_monitoring" do
    assert_difference('MorningMonitoring.count', -1) do
      delete :destroy, id: @morning_monitoring
    end

    assert_redirected_to morning_monitorings_path
  end
end
