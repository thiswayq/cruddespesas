require 'test_helper'

class DespesasControllerTest < ActionController::TestCase
  setup do
    @despesa = despesas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:despesas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create despesa" do
    assert_difference('Despesa.count') do
      post :create, despesa: { amount: @despesa.amount, comment: @despesa.comment, data: @despesa.data, description: @despesa.description, time: @despesa.time }
    end

    assert_redirected_to despesa_path(assigns(:despesa))
  end

  test "should show despesa" do
    get :show, id: @despesa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @despesa
    assert_response :success
  end

  test "should update despesa" do
    patch :update, id: @despesa, despesa: { amount: @despesa.amount, comment: @despesa.comment, data: @despesa.data, description: @despesa.description, time: @despesa.time }
    assert_redirected_to despesa_path(assigns(:despesa))
  end

  test "should destroy despesa" do
    assert_difference('Despesa.count', -1) do
      delete :destroy, id: @despesa
    end

    assert_redirected_to despesas_path
  end
end
