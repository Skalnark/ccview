class CreateClassModuleRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :class_module_relationships do |t|
      t.references :student_classes, foreign_key: true
      t.references :case_modules, foreign_key: true

      t.timestamps
    end
  end
end
