class BookController < ApplicationController
  def index
    books = Book.all 
    render json: books
  end

  def create
    book = Book.new(params['book'])
    byebug

  end

  def show
    byebug
  end
end
