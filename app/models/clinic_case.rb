class ClinicCase < ApplicationRecord
	belongs_to :topic
	has_many_attached :images

	def self.search(term)
		if term
			where('title LIKE ?', "%#{term}%").order('id DESC')
		else
			order('id DESC') 
		end
	end
end
