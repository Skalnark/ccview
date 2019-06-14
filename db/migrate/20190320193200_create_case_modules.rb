class CreateCaseModules < ActiveRecord::Migration[5.2]
  def change
    create_table :case_modules do |t|
      t.string :title
      t.text :description
      t.text :author
      t.string :image_label
      t.text :image_description

      t.timestamps
    end
  end
end
