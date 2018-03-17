class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :clinical_cases, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
