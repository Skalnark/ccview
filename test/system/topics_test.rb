require "application_system_test_case"

class TopicsTest < ApplicationSystemTestCase
  setup do
    @topic = topics(:one)
  end

  test "visiting the index" do
    visit topics_url
    assert_selector "h1", text: "Topics"
  end

  test "creating a Topic" do
    visit topics_url
    click_on "New Topic"

    fill_in "Cliniccase", with: @topic.ClinicCase_id
    fill_in "About", with: @topic.about
    fill_in "Authors", with: @topic.authors
    fill_in "Description", with: @topic.description
    fill_in "Title", with: @topic.title
    click_on "Create Topic"

    assert_text "Topic was successfully created"
    click_on "Back"
  end

  test "updating a Topic" do
    visit topics_url
    click_on "Edit", match: :first

    fill_in "Cliniccase", with: @topic.ClinicCase_id
    fill_in "About", with: @topic.about
    fill_in "Authors", with: @topic.authors
    fill_in "Description", with: @topic.description
    fill_in "Title", with: @topic.title
    click_on "Update Topic"

    assert_text "Topic was successfully updated"
    click_on "Back"
  end

  test "destroying a Topic" do
    visit topics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Topic was successfully destroyed"
  end
end
