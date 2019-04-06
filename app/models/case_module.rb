class CaseModule < ApplicationRecord
	has_many :topics, :dependent => :destroy
	has_one_attached :image

	def self.search(term)
		if term
			where('title LIKE ?', "%#{term}%").order('id DESC')
		else
			order('id DESC') 
		end
	end
end
