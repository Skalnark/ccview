require 'test_helper'

class ClassModuleRelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_module_relationship = class_module_relationships(:one)
  end

  test "should get index" do
    get class_module_relationships_url
    assert_response :success
  end

  test "should get new" do
    get new_class_module_relationship_url
    assert_response :success
  end

  test "should create class_module_relationship" do
    assert_difference('ClassModuleRelationship.count') do
      post class_module_relationships_url, params: { class_module_relationship: { case_modules_id: @class_module_relationship.case_modules_id, student_classes_id: @class_module_relationship.student_classes_id } }
    end

    assert_redirected_to class_module_relationship_url(ClassModuleRelationship.last)
  end

  test "should show class_module_relationship" do
    get class_module_relationship_url(@class_module_relationship)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_module_relationship_url(@class_module_relationship)
    assert_response :success
  end

  test "should update class_module_relationship" do
    patch class_module_relationship_url(@class_module_relationship), params: { class_module_relationship: { case_modules_id: @class_module_relationship.case_modules_id, student_classes_id: @class_module_relationship.student_classes_id } }
    assert_redirected_to class_module_relationship_url(@class_module_relationship)
  end

  test "should destroy class_module_relationship" do
    assert_difference('ClassModuleRelationship.count', -1) do
      delete class_module_relationship_url(@class_module_relationship)
    end

    assert_redirected_to class_module_relationships_url
  end
end
