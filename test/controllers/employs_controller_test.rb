require 'test_helper'

class EmploysControllerTest < ActionController::TestCase
  setup do
    @employ = employs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employ" do
    assert_difference('Employ.count') do
      post :create, employ: { designation: @employ.designation, dob: @employ.dob, email: @employ.email, first_name: @employ.first_name, last_name: @employ.last_name, role: @employ.role }
    end

    assert_redirected_to employ_path(assigns(:employ))
  end

  test "should show employ" do
    get :show, id: @employ
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employ
    assert_response :success
  end

  test "should update employ" do
    patch :update, id: @employ, employ: { designation: @employ.designation, dob: @employ.dob, email: @employ.email, first_name: @employ.first_name, last_name: @employ.last_name, role: @employ.role }
    assert_redirected_to employ_path(assigns(:employ))
  end

  test "should destroy employ" do
    assert_difference('Employ.count', -1) do
      delete :destroy, id: @employ
    end

    assert_redirected_to employs_path
  end
end
