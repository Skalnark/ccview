class ClinicCase < ApplicationRecord
	belongs_to :topic
	has_many_attached :images

	validate :is_fields_nil_clinic_case, on: [:create, :update]
	validate :is_an_image_type_clinic_case, on: [:create, :update]

	def thumbnail input
		return self.images[input].variant(resize: '282x282', auto_orient: true).processed
	end
	
	private 

	def is_fields_nil_clinic_case
		if !title.present?
			errors.add(:base, "Campo do título está vazio.")
		end
		if !clinicInformation.present?
			errors.add(:base, "Campo da informação clínica está vazio.")
		end
		if !description.present?
			errors.add(:base, "Campo da descrição está vazio.")
		end
		if !caseEvolution.present?
			errors.add(:base, "Campo da evolução do caso está vazio.")
		end
		if !extraInformation.present?
			errors.add(:base, "Campo do aprendendo um pouco mais está vazio.")
		end
	end

	def is_an_image_type_clinic_case
		if images.attached? == false
			errors.add(:base, 'Nenhuma imagem foi selecionada.')
		end

		if images.attached?
			if images.length > 10
				errors.add(:base, "#{images.length} arquivos foram selecionados, limite: 10")
			else 
				images.each do |image|
					if !image.content_type.in?(%('image/jpeg image/png image/jpg'))
						errors.add(:base, "Arquivo '#{image.filename}' não é uma imagem.")
					end
				end
			end
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
