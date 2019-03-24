class Topic < ApplicationRecord
  belongs_to :case_module
  has_many :clinic_cases, :dependent => :destroy
  has_one_attached :image
end
