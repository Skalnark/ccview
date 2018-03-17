class StudentClassRelationship < ApplicationRecord
  belongs_to :student_classes
  belongs_to :students
end
