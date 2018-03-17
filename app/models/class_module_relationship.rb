class ClassModuleRelationship < ApplicationRecord
  belongs_to :student_classes
  belongs_to :case_modules
end
