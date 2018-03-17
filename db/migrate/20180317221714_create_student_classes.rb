class CreateStudentClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :student_classes do |t|
      t.references :professor, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
