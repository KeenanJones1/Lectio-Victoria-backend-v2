class ReadingListController < ApplicationController
  def index
    readinglists = ReadingList.all
    authorization_object = Authorization.new(request)
    current_user = authorization_object.current_user
    user = User.find(current_user)
    if current_user === user.id 
    user.reading_lists.map{|list| list.dedupe}
    render json: UserSerializer.new(user).reading_list_serialized_json
    else
      byebug
    end
  end

  def create
    byebug
  end

  def new
    byebug
  end

  def show
    readingList = ReadingList.find(params['id'])
    render json: readingList.as_json( :include => {:reading_list_books => {:include => {:book => {:only => [:title, :author, :published_year, :genre, :description, :pages, :id, :book_cover]}}}})
  end

  # @user.to_json(:only => [:username, :email], :include => {:reading_lists => {:only => [:id, :name, :type], :include => {:reading_list_books => {:include => {:book => {:only => [:title, :author, :published_year, :genre, :description, :pages]}}}}}})

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
