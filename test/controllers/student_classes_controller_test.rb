require 'test_helper'

class StudentClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_class = student_classes(:one)
  end

  test "should get index" do
    get student_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_student_class_url
    assert_response :success
  end

  test "should create student_class" do
    assert_difference('StudentClass.count') do
      post student_classes_url, params: { student_class: { name: @student_class.name, professor_id: @student_class.professor_id } }
    end

    assert_redirected_to student_class_url(StudentClass.last)
  end

  test "should show student_class" do
    get student_class_url(@student_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_class_url(@student_class)
    assert_response :success
  end

  test "should update student_class" do
    patch student_class_url(@student_class), params: { student_class: { name: @student_class.name, professor_id: @student_class.professor_id } }
    assert_redirected_to student_class_url(@student_class)
  end

  test "should destroy student_class" do
    assert_difference('StudentClass.count', -1) do
      delete student_class_url(@student_class)
    end

    assert_redirected_to student_classes_url
  end
end
