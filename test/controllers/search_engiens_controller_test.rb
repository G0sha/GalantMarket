require 'test_helper'

class SearchEngiensControllerTest < ActionController::TestCase
  setup do
    @search_engien = search_engiens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_engiens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_engien" do
    assert_difference('SearchEngien.count') do
      post :create, search_engien: { footer: @search_engien.footer, head: @search_engien.head, title: @search_engien.title }
    end

    assert_redirected_to search_engien_path(assigns(:search_engien))
  end

  test "should show search_engien" do
    get :show, id: @search_engien
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @search_engien
    assert_response :success
  end

  test "should update search_engien" do
    patch :update, id: @search_engien, search_engien: { footer: @search_engien.footer, head: @search_engien.head, title: @search_engien.title }
    assert_redirected_to search_engien_path(assigns(:search_engien))
  end

  test "should destroy search_engien" do
    assert_difference('SearchEngien.count', -1) do
      delete :destroy, id: @search_engien
    end

    assert_redirected_to search_engiens_path
  end
end
