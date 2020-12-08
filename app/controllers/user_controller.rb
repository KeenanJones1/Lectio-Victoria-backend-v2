class UserController < ApplicationController
  def create
    user = User.create!(user_params)
    payload = { user_id: user.id }
    token = JsonWebToken.encode(payload)
    render json: user
  end

  private 
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
