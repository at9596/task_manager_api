class AuthController < ApplicationController
  def register
    user = User.new(user_params)

    if user.save!
      token = encode_token({ user_id: user.id })
      render json: { user: user, token: token }
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def login
    user = User.find_by(email: user_params[:email])

    if user&.authenticate(user_params[:password])
      token = encode_token({ user_id: user.id })
      render json: { token: token }
    else
      render json: { errors: "Invalid email or Password" }
    end
  end

  def logout
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
