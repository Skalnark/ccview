class CreateCasePictureRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :case_picture_relationships do |t|
      t.references :picture, foreign_key: true
      t.references :clinical_cases, foreign_key: true

      t.timestamps
    end
  end
end
