require 'test_helper'

class PageMessegsControllerTest < ActionController::TestCase
  setup do
    @page_messeg = page_messegs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_messegs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_messeg" do
    assert_difference('PageMesseg.count') do
      post :create, page_messeg: { cover: @page_messeg.cover, description: @page_messeg.description, title: @page_messeg.title }
    end

    assert_redirected_to page_messeg_path(assigns(:page_messeg))
  end

  test "should show page_messeg" do
    get :show, id: @page_messeg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_messeg
    assert_response :success
  end

  test "should update page_messeg" do
    patch :update, id: @page_messeg, page_messeg: { cover: @page_messeg.cover, description: @page_messeg.description, title: @page_messeg.title }
    assert_redirected_to page_messeg_path(assigns(:page_messeg))
  end

  test "should destroy page_messeg" do
    assert_difference('PageMesseg.count', -1) do
      delete :destroy, id: @page_messeg
    end

    assert_redirected_to page_messegs_path
  end
end
