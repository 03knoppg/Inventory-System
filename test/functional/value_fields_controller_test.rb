require 'test_helper'

class ValueFieldsControllerTest < ActionController::TestCase
  setup do
    @value_field = value_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:value_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create value_field" do
    assert_difference('ValueField.count') do
      post :create, value_field: @value_field.attributes
    end

    assert_redirected_to value_field_path(assigns(:value_field))
  end

  test "should show value_field" do
    get :show, id: @value_field.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @value_field.to_param
    assert_response :success
  end

  test "should update value_field" do
    put :update, id: @value_field.to_param, value_field: @value_field.attributes
    assert_redirected_to value_field_path(assigns(:value_field))
  end

  test "should destroy value_field" do
    assert_difference('ValueField.count', -1) do
      delete :destroy, id: @value_field.to_param
    end

    assert_redirected_to value_fields_path
  end
end
