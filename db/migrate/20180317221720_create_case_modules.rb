class CreateCaseModules < ActiveRecord::Migration[5.1]
  def change
    create_table :case_modules do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
