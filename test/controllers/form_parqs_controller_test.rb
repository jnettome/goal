require 'test_helper'

class FormParqsControllerTest < ActionController::TestCase
  setup do
    @form_parq = form_parqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_parqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_parq" do
    assert_difference('FormParq.count') do
      post :create, form_parq: { answer1: @form_parq.answer1, answer3: @form_parq.answer3, answer4: @form_parq.answer4, answer5: @form_parq.answer5, answer6: @form_parq.answer6, answer7: @form_parq.answer7, answer: @form_parq.answer, user_id: @form_parq.user_id }
    end

    assert_redirected_to form_parq_path(assigns(:form_parq))
  end

  test "should show form_parq" do
    get :show, id: @form_parq
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_parq
    assert_response :success
  end

  test "should update form_parq" do
    patch :update, id: @form_parq, form_parq: { answer1: @form_parq.answer1, answer3: @form_parq.answer3, answer4: @form_parq.answer4, answer5: @form_parq.answer5, answer6: @form_parq.answer6, answer7: @form_parq.answer7, answer: @form_parq.answer, user_id: @form_parq.user_id }
    assert_redirected_to form_parq_path(assigns(:form_parq))
  end

  test "should destroy form_parq" do
    assert_difference('FormParq.count', -1) do
      delete :destroy, id: @form_parq
    end

    assert_redirected_to form_parqs_path
  end
end
