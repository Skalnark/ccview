class CreateProfessorModuleRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :professor_module_relationships do |t|
      t.references :case_modules, foreign_key: true
      t.references :professors, foreign_key: true

      t.timestamps
    end
  end
end
