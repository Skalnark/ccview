class CasePictureRelationship < ApplicationRecord
  belongs_to :picture
  belongs_to :clinical_cases
end
