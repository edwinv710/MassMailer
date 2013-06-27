require 'test_helper'

class ServerListsControllerTest < ActionController::TestCase
  setup do
    @server_list = server_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:server_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create server_list" do
    assert_difference('ServerList.count') do
      post :create, server_list: { name: @server_list.name }
    end

    assert_redirected_to server_list_path(assigns(:server_list))
  end

  test "should show server_list" do
    get :show, id: @server_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @server_list
    assert_response :success
  end

  test "should update server_list" do
    put :update, id: @server_list, server_list: { name: @server_list.name }
    assert_redirected_to server_list_path(assigns(:server_list))
  end

  test "should destroy server_list" do
    assert_difference('ServerList.count', -1) do
      delete :destroy, id: @server_list
    end

    assert_redirected_to server_lists_path
  end
end
