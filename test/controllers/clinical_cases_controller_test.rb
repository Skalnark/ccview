require 'test_helper'

class ClinicalCasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clinical_case = clinical_cases(:one)
  end

  test "should get index" do
    get clinical_cases_url
    assert_response :success
  end

  test "should get new" do
    get new_clinical_case_url
    assert_response :success
  end

  test "should create clinical_case" do
    assert_difference('ClinicalCase.count') do
      post clinical_cases_url, params: { clinical_case: { auxText: @clinical_case.auxText, description: @clinical_case.description, name: @clinical_case.name } }
    end

    assert_redirected_to clinical_case_url(ClinicalCase.last)
  end

  test "should show clinical_case" do
    get clinical_case_url(@clinical_case)
    assert_response :success
  end

  test "should get edit" do
    get edit_clinical_case_url(@clinical_case)
    assert_response :success
  end

  test "should update clinical_case" do
    patch clinical_case_url(@clinical_case), params: { clinical_case: { auxText: @clinical_case.auxText, description: @clinical_case.description, name: @clinical_case.name } }
    assert_redirected_to clinical_case_url(@clinical_case)
  end

  test "should destroy clinical_case" do
    assert_difference('ClinicalCase.count', -1) do
      delete clinical_case_url(@clinical_case)
    end

    assert_redirected_to clinical_cases_url
  end
end
