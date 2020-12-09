class ReadingListController < ApplicationController
  def index
    readinglists = ReadingList.all
    render json: readinglists.as_json(
      only: [:id, :name, :type]
    )
  end

  def create
    byebug
  end

  def new
    byebug
  end

  def show
    byebug
  end

  def edit
    byebug
  end

  def update
    byebug
  end

  def destroy
    byebug
  end

  private 
  def reading_list_param
    # params.require(:user).permit(:username, :password)
    byebug
  end
end
