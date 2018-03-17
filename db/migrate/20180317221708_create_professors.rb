class CreateProfessors < ActiveRecord::Migration[5.1]
  def change
    create_table :professors do |t|
      t.references :person, foreign_key: true
      t.string :field
      t.string :formation
      t.string :degree

      t.timestamps
    end
  end
end
