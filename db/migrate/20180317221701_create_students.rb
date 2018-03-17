class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.references :person, foreign_key: true
      t.string :curse

      t.timestamps
    end
  end
end
