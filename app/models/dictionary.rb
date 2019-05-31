class Dictionary < ApplicationRecord
	validate :is_fields_nil, on: [:create, :update]

	def is_fields_nil
		if !term.present?
			errors.add(:base, "Campo do termo está vazio.")
		end
		if !description.present?
			errors.add(:base, "Campo da descrição está vazio.")
		end
	end
end
