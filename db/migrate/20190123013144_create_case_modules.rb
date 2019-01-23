class CreateCaseModules < ActiveRecord::Migration[5.2]
  def change
    create_table :case_modules do |t|
      t.string :title
      t.text :description
      t.string :authors
      t.text :privacyPolicy
      t.references :Topic, foreign_key: true

      t.timestamps
    end
  end
end
