require 'test_helper'

class ValuefieldsControllerTest < ActionController::TestCase
  setup do
    @valuefield = valuefields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:valuefields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create valuefield" do
    assert_difference('Valuefield.count') do
      post :create, valuefield: @valuefield.attributes
    end

    assert_redirected_to valuefield_path(assigns(:valuefield))
  end

  test "should show valuefield" do
    get :show, id: @valuefield.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @valuefield.to_param
    assert_response :success
  end

  test "should update valuefield" do
    put :update, id: @valuefield.to_param, valuefield: @valuefield.attributes
    assert_redirected_to valuefield_path(assigns(:valuefield))
  end

  test "should destroy valuefield" do
    assert_difference('Valuefield.count', -1) do
      delete :destroy, id: @valuefield.to_param
    end

    assert_redirected_to valuefields_path
  end
end
