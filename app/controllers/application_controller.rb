class ApplicationController < ActionController::API
  include JsonWebToken

  protected

  def authorize_request
    header = request.headers["Authorization"]
    token = header.split(" ").last if header

    decoded =decode_token(token) if token

    if decoded
      @current_user = User.find(decode["user_id"])
    else
     render json: { error: "Unauthorized Access" }, status: :unauthorized
    end
  end
end
