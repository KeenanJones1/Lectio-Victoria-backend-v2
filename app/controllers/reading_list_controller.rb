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
    readingList = ReadingList.find(params['id'])
    render json: readingList.as_json( include: :reading_list_books)
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
