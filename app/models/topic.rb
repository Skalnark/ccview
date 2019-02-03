class Topic < ApplicationRecord
  belongs_to :caseModule
  has_one_attached :image
end
