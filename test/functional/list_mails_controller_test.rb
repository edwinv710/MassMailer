require 'test_helper'

class ListMailsControllerTest < ActionController::TestCase
  setup do
    @list_mail = list_mails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:list_mails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list_mail" do
    assert_difference('ListMail.count') do
      post :create, list_mail: {  }
    end

    assert_redirected_to list_mail_path(assigns(:list_mail))
  end

  test "should show list_mail" do
    get :show, id: @list_mail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list_mail
    assert_response :success
  end

  test "should update list_mail" do
    put :update, id: @list_mail, list_mail: {  }
    assert_redirected_to list_mail_path(assigns(:list_mail))
  end

  test "should destroy list_mail" do
    assert_difference('ListMail.count', -1) do
      delete :destroy, id: @list_mail
    end

    assert_redirected_to list_mails_path
  end
end
