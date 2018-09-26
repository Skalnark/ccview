require 'test_helper'

class ClinicCasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clinic_case = clinic_cases(:one)
  end

  test "should get index" do
    get clinic_cases_url
    assert_response :success
  end

  test "should get new" do
    get new_clinic_case_url
    assert_response :success
  end

  test "should create clinic_case" do
    assert_difference('ClinicCase.count') do
      post clinic_cases_url, params: { clinic_case: { caseEvolution: @clinic_case.caseEvolution, clinicInformation: @clinic_case.clinicInformation, description: @clinic_case.description, extraInformation: @clinic_case.extraInformation, title: @clinic_case.title } }
    end

    assert_redirected_to clinic_case_url(ClinicCase.last)
  end

  test "should show clinic_case" do
    get clinic_case_url(@clinic_case)
    assert_response :success
  end

  test "should get edit" do
    get edit_clinic_case_url(@clinic_case)
    assert_response :success
  end

  test "should update clinic_case" do
    patch clinic_case_url(@clinic_case), params: { clinic_case: { caseEvolution: @clinic_case.caseEvolution, clinicInformation: @clinic_case.clinicInformation, description: @clinic_case.description, extraInformation: @clinic_case.extraInformation, title: @clinic_case.title } }
    assert_redirected_to clinic_case_url(@clinic_case)
  end

  test "should destroy clinic_case" do
    assert_difference('ClinicCase.count', -1) do
      delete clinic_case_url(@clinic_case)
    end

    assert_redirected_to clinic_cases_url
  end
end
