require 'authorization.rb'

class AuthController < ApplicationController
  def create
    auth_object = Authentication.new(login_params)
    user = User.find_by(username: params['username'])
    if auth_object.authenticate
      render json: {
        message: "Login successful!", token: auth_object.generate_token, username: user.username}, status: :ok
    else
      render json: {
        message: "Incorrect username/password combination"}, status: :unauthorized
    end
  end

  def show
    authorization_object = Authorization.new(request)
    # the following line does not work.
    current_user = authorization_object.current_user
    user = User.find(current_user)
    if current_user 
     render json: UserSerializer.new(user).to_serialized_json
   else
     render json: {error: 'Invalid Token'}, status: 401
    end
  end

  private 
  def login_params
    params.require(:auth).permit(:username, :password)
  end
end
