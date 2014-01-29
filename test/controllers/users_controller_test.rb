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

  test "should create teacher user" do
    assert_difference('User.count') do
      post :create, user: {
        email: @user.email.gsub(/w/, '') + rand(1000000).to_s + "@bol.com", # TODO xunxo
        password: '1234',
        password_confirmation: '1234',
        type: @user.type,
        city: @user.city,
        state: 'PR',
        document: @user.document,
        specialty: @user.specialty,
        name: @user.name,
        short_bio: @user.short_bio
      }
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
