class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  enum role: [:student, :professor, :admin]
end
