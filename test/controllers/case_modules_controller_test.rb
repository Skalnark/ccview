require 'test_helper'

class CaseModulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @case_module = case_modules(:one)
  end

  test "should get index" do
    get case_modules_url
    assert_response :success
  end

  test "should get new" do
    get new_case_module_url
    assert_response :success
  end

  test "should create case_module" do
    assert_difference('CaseModule.count') do
      post case_modules_url, params: { case_module: { description: @case_module.description, name: @case_module.name } }
    end

    assert_redirected_to case_module_url(CaseModule.last)
  end

  test "should show case_module" do
    get case_module_url(@case_module)
    assert_response :success
  end

  test "should get edit" do
    get edit_case_module_url(@case_module)
    assert_response :success
  end

  test "should update case_module" do
    patch case_module_url(@case_module), params: { case_module: { description: @case_module.description, name: @case_module.name } }
    assert_redirected_to case_module_url(@case_module)
  end

  test "should destroy case_module" do
    assert_difference('CaseModule.count', -1) do
      delete case_module_url(@case_module)
    end

    assert_redirected_to case_modules_url
  end
end
