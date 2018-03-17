require 'test_helper'

class StudentClassRelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_class_relationship = student_class_relationships(:one)
  end

  test "should get index" do
    get student_class_relationships_url
    assert_response :success
  end

  test "should get new" do
    get new_student_class_relationship_url
    assert_response :success
  end

  test "should create student_class_relationship" do
    assert_difference('StudentClassRelationship.count') do
      post student_class_relationships_url, params: { student_class_relationship: { student_classes_id: @student_class_relationship.student_classes_id, students_id: @student_class_relationship.students_id } }
    end

    assert_redirected_to student_class_relationship_url(StudentClassRelationship.last)
  end

  test "should show student_class_relationship" do
    get student_class_relationship_url(@student_class_relationship)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_class_relationship_url(@student_class_relationship)
    assert_response :success
  end

  test "should update student_class_relationship" do
    patch student_class_relationship_url(@student_class_relationship), params: { student_class_relationship: { student_classes_id: @student_class_relationship.student_classes_id, students_id: @student_class_relationship.students_id } }
    assert_redirected_to student_class_relationship_url(@student_class_relationship)
  end

  test "should destroy student_class_relationship" do
    assert_difference('StudentClassRelationship.count', -1) do
      delete student_class_relationship_url(@student_class_relationship)
    end

    assert_redirected_to student_class_relationships_url
  end
end
