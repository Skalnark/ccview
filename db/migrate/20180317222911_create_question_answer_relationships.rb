class CreateQuestionAnswerRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :question_answer_relationships do |t|
      t.references :answer, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
