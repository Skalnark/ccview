class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  has_many_attached :images
end
