class CaseModule < ApplicationRecord
	has_many :topics, :dependent => :destroy
	has_one_attached :image
end
