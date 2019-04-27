class CaseModule < ApplicationRecord
	has_many :topics, :dependent => :destroy
	has_one_attached :image
	validates :title, presence: true
	validates :description, presence: true
	validates :author, presence: true
	validate :is_an_image_type, on: [:create,:update]


	private 

	def is_an_image_type
		if image.attached? && !image.content_type.in?(%w(image/*))
			errors.add(:image, 'Arquivo selecionado não é uma imagem.')
		else image.attached? == false
			errors.add(:image, 'Nenhuma imagem selecionada')
		end
	end

	def self.search(term)
		if term
			where('title LIKE ?', "%#{term}%").order('id DESC')
		else
			order('id DESC') 
		end
	end
end
