# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    debugger
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
