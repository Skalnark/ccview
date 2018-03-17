require 'test_helper'

class ProfessorModuleRelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professor_module_relationship = professor_module_relationships(:one)
  end

  test "should get index" do
    get professor_module_relationships_url
    assert_response :success
  end

  test "should get new" do
    get new_professor_module_relationship_url
    assert_response :success
  end

  test "should create professor_module_relationship" do
    assert_difference('ProfessorModuleRelationship.count') do
      post professor_module_relationships_url, params: { professor_module_relationship: { case_modules_id: @professor_module_relationship.case_modules_id, professors_id: @professor_module_relationship.professors_id } }
    end

    assert_redirected_to professor_module_relationship_url(ProfessorModuleRelationship.last)
  end

  test "should show professor_module_relationship" do
    get professor_module_relationship_url(@professor_module_relationship)
    assert_response :success
  end

  test "should get edit" do
    get edit_professor_module_relationship_url(@professor_module_relationship)
    assert_response :success
  end

  test "should update professor_module_relationship" do
    patch professor_module_relationship_url(@professor_module_relationship), params: { professor_module_relationship: { case_modules_id: @professor_module_relationship.case_modules_id, professors_id: @professor_module_relationship.professors_id } }
    assert_redirected_to professor_module_relationship_url(@professor_module_relationship)
  end

  test "should destroy professor_module_relationship" do
    assert_difference('ProfessorModuleRelationship.count', -1) do
      delete professor_module_relationship_url(@professor_module_relationship)
    end

    assert_redirected_to professor_module_relationships_url
  end
end
