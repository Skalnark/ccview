class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.string :authors
      t.text :about
      t.references :caseModule, foreign_key: true

      t.timestamps
    end
  end
end
