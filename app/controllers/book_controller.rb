class BookController < ApplicationController
  def index
    books = Book.all 
    render json: books
  end
end
