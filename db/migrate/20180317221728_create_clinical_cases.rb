class CreateClinicalCases < ActiveRecord::Migration[5.1]
  def change
    create_table :clinical_cases do |t|
      t.string :name
      t.text :description
      t.text :auxText

      t.timestamps
    end
  end
end
