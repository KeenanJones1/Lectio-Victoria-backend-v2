class BookController < ApplicationController
  def index
    books = Book.all 
    render json: books
  end

  def create
    @author = params['book']['volumeInfo']['authors'].map { |i| i.to_s }.join(",")

  @title = params['book']['volumeInfo']['title']
  @published_year = params['book']['volumeInfo']['publishedDate']
  @description = params['book']['volumeInfo']['description']
  @pages = params['book']['volumeInfo']['pageCount']
  @book_cover = params['book']['volumeInfo']['imageLinks']['thumbnail']
  book = Book.create(title: @title, published_year: @published_year,description: @description, pages: @pages, book_cover: @book_cover, author: @author)
  render json: book.to_json
  end

  def show
    byebug
  end
end
