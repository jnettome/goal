require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    login_user
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { salt: @user.salt, email: @user.email, crypted_password: @user.crypted_password }
    end

    assert_redirected_to users_path
  end

  test "should show user" do
    login_user
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    login_user
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    login_user
    patch :update, id: @user, user: { email: @user.email }
    assert_response :success
  end

  test "should destroy user" do
    login_user
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
