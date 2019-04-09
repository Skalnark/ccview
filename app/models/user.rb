class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :student
  end

  def promover_professor
    self.role ||= :professor
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
