require 'test_helper'

class EnrollmentsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    login_user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

end
