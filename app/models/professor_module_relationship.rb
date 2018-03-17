class ProfessorModuleRelationship < ApplicationRecord
  belongs_to :case_modules
  belongs_to :professors
end
