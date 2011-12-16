require 'test_helper'

class TableAliasesControllerTest < ActionController::TestCase
  setup do
    @table_alias = table_aliases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:table_aliases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create table_alias" do
    assert_difference('TableAlias.count') do
      post :create, table_alias: @table_alias.attributes
    end

    assert_redirected_to table_alias_path(assigns(:table_alias))
  end

  test "should show table_alias" do
    get :show, id: @table_alias.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @table_alias.to_param
    assert_response :success
  end

  test "should update table_alias" do
    put :update, id: @table_alias.to_param, table_alias: @table_alias.attributes
    assert_redirected_to table_alias_path(assigns(:table_alias))
  end

  test "should destroy table_alias" do
    assert_difference('TableAlias.count', -1) do
      delete :destroy, id: @table_alias.to_param
    end

    assert_redirected_to table_aliases_path
  end
end
