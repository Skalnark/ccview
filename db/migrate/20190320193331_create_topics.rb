class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.text :authors
      t.text :about
      t.string :image_label
      t.text :image_description
      t.integer :case_module_id

      t.timestamps
    end
  end
end
