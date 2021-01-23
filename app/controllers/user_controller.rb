require "json_web_token.rb"

class UserController < ApplicationController
  def show
    user = User.find(params["id"])
    if user
      render json: UserSerializer.new(user).to_serialized_json
    end
  end


  def create
    user = User.new(user_params)
    if user.save
        payload = { user_id: user.id }
        token = JsonWebToken.encode(payload)
        UserMailer.with(user: user).welcome_email.deliver_now
        render json: token.to_json
      else
        render json: {errors: user.errors.full_messages}
      end
  end


  private 
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
