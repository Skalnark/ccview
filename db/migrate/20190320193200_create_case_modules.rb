class CreateCaseModules < ActiveRecord::Migration[5.2]
  def change
    create_table :case_modules do |t|
      t.string :title
      t.text :description
      t.string :author
      t.text :dictionary
      t.text :privacy

      t.timestamps
    end
  end
end
