require 'test_helper'

class CasePictureRelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @case_picture_relationship = case_picture_relationships(:one)
  end

  test "should get index" do
    get case_picture_relationships_url
    assert_response :success
  end

  test "should get new" do
    get new_case_picture_relationship_url
    assert_response :success
  end

  test "should create case_picture_relationship" do
    assert_difference('CasePictureRelationship.count') do
      post case_picture_relationships_url, params: { case_picture_relationship: { clinical_cases_id: @case_picture_relationship.clinical_cases_id, picture_id: @case_picture_relationship.picture_id } }
    end

    assert_redirected_to case_picture_relationship_url(CasePictureRelationship.last)
  end

  test "should show case_picture_relationship" do
    get case_picture_relationship_url(@case_picture_relationship)
    assert_response :success
  end

  test "should get edit" do
    get edit_case_picture_relationship_url(@case_picture_relationship)
    assert_response :success
  end

  test "should update case_picture_relationship" do
    patch case_picture_relationship_url(@case_picture_relationship), params: { case_picture_relationship: { clinical_cases_id: @case_picture_relationship.clinical_cases_id, picture_id: @case_picture_relationship.picture_id } }
    assert_redirected_to case_picture_relationship_url(@case_picture_relationship)
  end

  test "should destroy case_picture_relationship" do
    assert_difference('CasePictureRelationship.count', -1) do
      delete case_picture_relationship_url(@case_picture_relationship)
    end

    assert_redirected_to case_picture_relationships_url
  end
end
