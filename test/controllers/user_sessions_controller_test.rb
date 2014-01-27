require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    login_user
    get :destroy
    assert_redirected_to users_path
  end

end
