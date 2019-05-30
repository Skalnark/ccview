class CreateDictionaries < ActiveRecord::Migration[5.2]
  def change
    create_table :dictionaries do |t|
      t.string :term
      t.text :description

      t.timestamps
    end
  end
end
