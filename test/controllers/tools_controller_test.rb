require 'test_helper'

class ToolsControllerTest < ActionController::TestCase
  setup do
    @tool = tools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tool" do
    assert_difference('Tool.count') do
      post :create, tool: { cmd: @tool.cmd, desc: @tool.desc, name: @tool.name, p1: @tool.p1, p1_desc: @tool.p1_desc, p2: @tool.p2, p2_desc: @tool.p2_desc, p3: @tool.p3, p3_desc: @tool.p3_desc, p4: @tool.p4, p4_desc: @tool.p4_desc }
    end

    assert_redirected_to tool_path(assigns(:tool))
  end

  test "should show tool" do
    get :show, id: @tool
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tool
    assert_response :success
  end

  test "should update tool" do
    patch :update, id: @tool, tool: { cmd: @tool.cmd, desc: @tool.desc, name: @tool.name, p1: @tool.p1, p1_desc: @tool.p1_desc, p2: @tool.p2, p2_desc: @tool.p2_desc, p3: @tool.p3, p3_desc: @tool.p3_desc, p4: @tool.p4, p4_desc: @tool.p4_desc }
    assert_redirected_to tool_path(assigns(:tool))
  end

  test "should destroy tool" do
    assert_difference('Tool.count', -1) do
      delete :destroy, id: @tool
    end

    assert_redirected_to tools_path
  end
end
