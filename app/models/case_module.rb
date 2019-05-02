class CaseModule < ApplicationRecord
	has_many :topics, :dependent => :destroy
	has_one_attached :image
	validate :is_fields_nil_module, on: [:create, :update]
	validate :is_an_image_type_module, on: [:create, :update]
	
	def thumbnail
		return self.image.variant(resize: '282x282', auto_orient: true).processed
	end

	private 

	def is_an_image_type_module
		if image.attached? == false
			errors.add(:base, 'Nenhuma imagem foi selecionada.')
		end

		if image.attached? && !image.content_type.in?(%('image/jpeg image/png image/jpg'))
			errors.add(:base, "Arquivo '#{image.filename}' não é uma imagem.")
		end
	end

	def is_fields_nil_module
		if !title.present?
			errors.add(:base, "Campo do título está vazio.")
		end
		if !description.present?
			errors.add(:base, "Campo da descrição está vazio.")
		end
		if !author.present?
			errors.add(:base, "Campo dos autores está vazio.")
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
