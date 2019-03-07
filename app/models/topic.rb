class Topic < ApplicationRecord
  belongs_to :case_module, :dependent => :destroy
  has_many :clinic_cases, :dependent => :destroy
  has_one_attached :image
end
