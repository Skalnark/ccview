require 'test_helper'

class QuestionAnswerRelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_answer_relationship = question_answer_relationships(:one)
  end

  test "should get index" do
    get question_answer_relationships_url
    assert_response :success
  end

  test "should get new" do
    get new_question_answer_relationship_url
    assert_response :success
  end

  test "should create question_answer_relationship" do
    assert_difference('QuestionAnswerRelationship.count') do
      post question_answer_relationships_url, params: { question_answer_relationship: { answer_id: @question_answer_relationship.answer_id, question_id: @question_answer_relationship.question_id } }
    end

    assert_redirected_to question_answer_relationship_url(QuestionAnswerRelationship.last)
  end

  test "should show question_answer_relationship" do
    get question_answer_relationship_url(@question_answer_relationship)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_answer_relationship_url(@question_answer_relationship)
    assert_response :success
  end

  test "should update question_answer_relationship" do
    patch question_answer_relationship_url(@question_answer_relationship), params: { question_answer_relationship: { answer_id: @question_answer_relationship.answer_id, question_id: @question_answer_relationship.question_id } }
    assert_redirected_to question_answer_relationship_url(@question_answer_relationship)
  end

  test "should destroy question_answer_relationship" do
    assert_difference('QuestionAnswerRelationship.count', -1) do
      delete question_answer_relationship_url(@question_answer_relationship)
    end

    assert_redirected_to question_answer_relationships_url
  end
end
