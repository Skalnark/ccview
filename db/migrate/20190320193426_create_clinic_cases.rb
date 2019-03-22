class CreateClinicCases < ActiveRecord::Migration[5.2]
  def change
    create_table :clinic_cases do |t|
      t.string :title
      t.text :clinicInformation
      t.text :description
      t.text :caseEvolution
      t.text :extraInformation
      t.integer :topic_id

      t.timestamps
    end
  end
end
