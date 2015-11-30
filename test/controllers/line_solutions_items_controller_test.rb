require 'test_helper'

class LineSolutionsItemsControllerTest < ActionController::TestCase
  setup do
    @line_solutions_item = line_solutions_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_solutions_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_solutions_item" do
    assert_difference('LineSolutionsItem.count') do
      post :create, line_solutions_item: { product_id: @line_solutions_item.product_id, solution_id: @line_solutions_item.solution_id }
    end

    assert_redirected_to line_solutions_item_path(assigns(:line_solutions_item))
  end

  test "should show line_solutions_item" do
    get :show, id: @line_solutions_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_solutions_item
    assert_response :success
  end

  test "should update line_solutions_item" do
    patch :update, id: @line_solutions_item, line_solutions_item: { product_id: @line_solutions_item.product_id, solution_id: @line_solutions_item.solution_id }
    assert_redirected_to line_solutions_item_path(assigns(:line_solutions_item))
  end

  test "should destroy line_solutions_item" do
    assert_difference('LineSolutionsItem.count', -1) do
      delete :destroy, id: @line_solutions_item
    end

    assert_redirected_to line_solutions_items_path
  end
end
