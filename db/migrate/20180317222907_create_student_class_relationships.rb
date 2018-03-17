class CreateStudentClassRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :student_class_relationships do |t|
      t.references :student_classes, foreign_key: true
      t.references :students, foreign_key: true

      t.timestamps
    end
  end
end
