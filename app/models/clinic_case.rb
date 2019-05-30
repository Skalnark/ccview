class ClinicCase < ApplicationRecord
	serialize :image_label, Hash
	serialize :image_description, Hash
	belongs_to :topic
	has_many_attached :images
	validate :is_description_clinic_case_fields_nil, on: [:create, :update], :if => lambda { |o| o.current_step == "description" }
	validate :is_an_image_type_clinic_case, on: [:create, :update], :if => lambda { |o| o.current_step == "description" }
	validate :is_image_clinic_case_fields_nil, on: [:create, :update], :if => lambda { |o| o.current_step == "image" }
	attr_writer :current_step

	def current_step
		@current_step || steps.first
	end

	def steps
		%w[description image]
	end

	def next_step
		self.current_step = steps[steps.index(current_step) + 1]
	end

	def previous_step
		self.current_step = steps[steps.index(current_step) - 1]
	end

	def first_step?
		self.current_step == steps.first
	end

	def last_step?
		self.current_step == steps.last
	end

	def thumbnail input
		return self.images[input].variant(resize: '282x282', auto_orient: true).processed
	end
	
	private 

	def is_description_clinic_case_fields_nil
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

	def is_image_clinic_case_fields_nil
		image_label.each do |key, label|
			if !label.present?
				errors.add(:base, "Legenda da imagem número: #{key} está vazia")
			end
		end

		image_description.each do |key, description|
			if !description.present?
				errors.add(:base, "Descrição da imagem número: #{key} está vazia")
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
