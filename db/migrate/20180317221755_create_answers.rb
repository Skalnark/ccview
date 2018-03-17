class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :text
      t.boolean :value
      t.text :auxAnswer

      t.timestamps
    end
  end
end
