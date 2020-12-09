class UserController < ApplicationController
  def show
    user = User.find(params["id"])
    if user
      render json: user.as_json(
       only: [:username, :email],
       include: {reading_lists: {only: [:id, :name, :type], include: {reading_list_books: {include: {book: {only: [:title, :author, :published_year, :genre, :description, :pages]}}}}}}
      )
    end
  end

  # ,include: { user: { only: [:id, :username] } }

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
