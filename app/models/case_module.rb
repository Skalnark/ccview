class CaseModule < ApplicationRecord
	has_many :topics
	has_one_attached :image
end
