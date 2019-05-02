class Topic < ApplicationRecord
	belongs_to :case_module
	has_many :clinic_cases, :dependent => :destroy
	has_one_attached :image
	validate :is_fields_nil_topic, on: [:create, :update]
	validate :is_an_image_type_topic, on: [:create, :update]

	def thumbnail
		return self.image.variant(resize: '282x282', auto_orient: true).processed
	end
	
	private 

	def is_an_image_type_topic
		if image.attached? == false
			errors.add(:base, 'Nenhuma imagem foi selecionada.')
		end

		if image.attached? && !image.content_type.in?(%('image/jpeg image/png image/jpg'))
			errors.add(:base, "Arquivo '#{image.filename}' não é uma imagem.")
		end
	end

	def is_fields_nil_topic
		if !title.present?
			errors.add(:base, "Campo do título está vazio.")
		end
		if !description.present?
			errors.add(:base, "Campo da descrição está vazio.")
		end
		if !authors.present?
			errors.add(:base, "Campo dos autores está vazio.")
		end
		if !about.present?
			errors.add(:base, "Campo sobre o Assunto está vazio.")
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
