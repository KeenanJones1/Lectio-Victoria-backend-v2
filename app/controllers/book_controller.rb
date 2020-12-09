class BookController < ApplicationController
  def index
    books = Book.all 
    render json: books
  end

  def create
    byebug
  end

  def show
    byebug
  end
end
