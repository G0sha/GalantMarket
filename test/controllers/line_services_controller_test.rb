require 'test_helper'

class LineServicesControllerTest < ActionController::TestCase
  setup do
    @line_service = line_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_service" do
    assert_difference('LineService.count') do
      post :create, line_service: { cart_id: @line_service.cart_id, service_id: @line_service.service_id }
    end

    assert_redirected_to line_service_path(assigns(:line_service))
  end

  test "should show line_service" do
    get :show, id: @line_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_service
    assert_response :success
  end

  test "should update line_service" do
    patch :update, id: @line_service, line_service: { cart_id: @line_service.cart_id, service_id: @line_service.service_id }
    assert_redirected_to line_service_path(assigns(:line_service))
  end

  test "should destroy line_service" do
    assert_difference('LineService.count', -1) do
      delete :destroy, id: @line_service
    end

    assert_redirected_to line_services_path
  end
end
