require "application_system_test_case"

class ClinicCasesTest < ApplicationSystemTestCase
  setup do
    @clinic_case = clinic_cases(:one)
  end

  test "visiting the index" do
    visit clinic_cases_url
    assert_selector "h1", text: "Clinic Cases"
  end

  test "creating a Clinic case" do
    visit clinic_cases_url
    click_on "New Clinic Case"

    fill_in "Caseevolution", with: @clinic_case.caseEvolution
    fill_in "Clinicinformation", with: @clinic_case.clinicInformation
    fill_in "Description", with: @clinic_case.description
    fill_in "Extrainformation", with: @clinic_case.extraInformation
    fill_in "Title", with: @clinic_case.title
    fill_in "Topic", with: @clinic_case.topic_id
    click_on "Create Clinic case"

    assert_text "Clinic case was successfully created"
    click_on "Back"
  end

  test "updating a Clinic case" do
    visit clinic_cases_url
    click_on "Edit", match: :first

    fill_in "Caseevolution", with: @clinic_case.caseEvolution
    fill_in "Clinicinformation", with: @clinic_case.clinicInformation
    fill_in "Description", with: @clinic_case.description
    fill_in "Extrainformation", with: @clinic_case.extraInformation
    fill_in "Title", with: @clinic_case.title
    fill_in "Topic", with: @clinic_case.topic_id
    click_on "Update Clinic case"

    assert_text "Clinic case was successfully updated"
    click_on "Back"
  end

  test "destroying a Clinic case" do
    visit clinic_cases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clinic case was successfully destroyed"
  end
end
