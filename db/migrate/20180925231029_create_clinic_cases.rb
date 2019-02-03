class CreateClinicCases < ActiveRecord::Migration[5.2]
  def change
    create_table :clinic_cases do |t|
      t.string :title
      t.text :clinicInformation
      t.text :description
      t.text :caseEvolution
      t.text :extraInformation

      t.references :topic, foreign_key: true
      t.timestamps
    end
  end
end
