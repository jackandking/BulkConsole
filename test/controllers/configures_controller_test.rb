require 'test_helper'

class ConfiguresControllerTest < ActionController::TestCase
  setup do
    @configure = configures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:configures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create configure" do
    assert_difference('Configure.count') do
      post :create, configure: { f1: @configure.f1, f2: @configure.f2, f3: @configure.f3, f4: @configure.f4, s1: @configure.s1, s2: @configure.s2, s3: @configure.s3, s4: @configure.s4, task_id: @configure.task_id }
    end

    assert_redirected_to configure_path(assigns(:configure))
  end

  test "should show configure" do
    get :show, id: @configure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @configure
    assert_response :success
  end

  test "should update configure" do
    patch :update, id: @configure, configure: { f1: @configure.f1, f2: @configure.f2, f3: @configure.f3, f4: @configure.f4, s1: @configure.s1, s2: @configure.s2, s3: @configure.s3, s4: @configure.s4, task_id: @configure.task_id }
    assert_redirected_to configure_path(assigns(:configure))
  end

  test "should destroy configure" do
    assert_difference('Configure.count', -1) do
      delete :destroy, id: @configure
    end

    assert_redirected_to configures_path
  end
end
