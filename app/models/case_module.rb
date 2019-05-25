class CaseModule < ApplicationRecord
	has_many :topics, :dependent => :destroy
	has_one_attached :image
	validate :is_description_module_fields_nil, on: [:create, :update], :if => lambda { |o| o.current_step == "description" }
	validate :is_an_image_type_module, on: [:create, :update], :if => lambda { |o| o.current_step == "description" }
	validate :is_image_module_fields_nil, on: [:create, :update], :if => lambda { |o| o.current_step == "image" }
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

	def first_step?
		self.current_step == steps.first
	end

	def last_step?
		self.current_step == steps.last
	end
	
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

	def is_description_module_fields_nil
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

	def is_image_module_fields_nil
		if !image_subtitle.present?
			errors.add(:base, "Campo da legenda da imagem está vazio.")
		end
		if !image_description.present?
			errors.add(:base, "Campo da descrição da imagem está vazio.")
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
