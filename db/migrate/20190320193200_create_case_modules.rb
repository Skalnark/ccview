class CreateCaseModules < ActiveRecord::Migration[5.2]
  def change
    create_table :case_modules do |t|
      t.string :title
      t.text :description
      t.text :author
      t.text :dictionary
      t.string :image_subtitle
      t.text :image_description

      t.timestamps
    end
  end
end
