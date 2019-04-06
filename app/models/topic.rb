class Topic < ApplicationRecord
	belongs_to :case_module
	has_many :clinic_cases, :dependent => :destroy
	has_one_attached :image

	def self.search(term)
		if term
			where('title LIKE ?', "%#{term}%").order('id DESC')
		else
			order('id DESC') 
		end
	end
end
