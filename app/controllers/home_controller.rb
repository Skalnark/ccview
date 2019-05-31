class HomeController < ApplicationController
  def Index
  end

  def About
  end

  def tornar_professor
  	@user = User.find_by_email(params[:email])

    respond_to do |format|
      if @user.update_attribute(:role, "professor")
        format.html { redirect_to home_administration_path, notice: "'#{@user.email}' agora é um professor.'" }
        format.json { render json: @user }
      else
        format.html { redirect_to home_administration_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def tornar_estudante
    @user = User.find_by_email(params[:email])

    respond_to do |format|
      if @user.update_attribute(:role, "student")
        format.html { redirect_to home_administration_path, notice: "'#{@user.email}' agora é um estudante." }
        format.json { render json: @user }
      else
        format.html { redirect_to home_administration_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
