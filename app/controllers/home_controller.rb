class HomeController < ApplicationController
  def Index
  end

  def About
  end

  def tornar_professor email
  	@user = User.find_by email: to_s(email)
  	@user.update_attribute(:role, "professor")
  end

  def tornar_estudante(email)
    @user = User.find_by email: to_s(email)
    @user.update_attribute(:role, "student")
  end

end
