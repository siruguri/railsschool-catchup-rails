require 'test_helper'

class MayorsControllerTest < ActionController::TestCase
  setup do
    @mayor = mayors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mayors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mayor" do
    assert_difference('Mayor.count') do
      post :create, mayor: { age: @mayor.age, name: @mayor.name }
    end

    assert_redirected_to mayor_path(assigns(:mayor))
  end

  test "should show mayor" do
    get :show, id: @mayor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mayor
    assert_response :success
  end

  test "should update mayor" do
    patch :update, id: @mayor, mayor: { age: @mayor.age, name: @mayor.name }
    assert_redirected_to mayor_path(assigns(:mayor))
  end

  test "should destroy mayor" do
    assert_difference('Mayor.count', -1) do
      delete :destroy, id: @mayor
    end

    assert_redirected_to mayors_path
  end
end
