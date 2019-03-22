require "application_system_test_case"

class CaseModulesTest < ApplicationSystemTestCase
  setup do
    @case_module = case_modules(:one)
  end

  test "visiting the index" do
    visit case_modules_url
    assert_selector "h1", text: "Case Modules"
  end

  test "creating a Case module" do
    visit case_modules_url
    click_on "New Case Module"

    fill_in "Author", with: @case_module.author
    fill_in "Description", with: @case_module.description
    fill_in "Dictionary", with: @case_module.dictionary
    fill_in "Privacy", with: @case_module.privacy
    fill_in "Title", with: @case_module.title
    click_on "Create Case module"

    assert_text "Case module was successfully created"
    click_on "Back"
  end

  test "updating a Case module" do
    visit case_modules_url
    click_on "Edit", match: :first

    fill_in "Author", with: @case_module.author
    fill_in "Description", with: @case_module.description
    fill_in "Dictionary", with: @case_module.dictionary
    fill_in "Privacy", with: @case_module.privacy
    fill_in "Title", with: @case_module.title
    click_on "Update Case module"

    assert_text "Case module was successfully updated"
    click_on "Back"
  end

  test "destroying a Case module" do
    visit case_modules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Case module was successfully destroyed"
  end
end
