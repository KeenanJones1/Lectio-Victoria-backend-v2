class BookController < ApplicationController
  def index
    books = Book.all 
    render json: books
  end

  def create
# Clean this shit up!!!!
# Book variables
  @author = params['book']['authors'].map { |i| i.to_s }.join(",")
  @title = params['book']['title']
  @published_year = params['book']['publishedDate']
  @description = params['book']['description']
  @pages = params['book']['pageCount']
# Find reading Lists
  readingList = ReadingList.find(params["list_id"])
  rlbs = readingList.reading_list_books

  if params['book']['imageLinks']
    @book_cover = params['book']['imageLinks']['thumbnail']
  else
    @book_cover = nil
  end


  if rlbs.select{|x| x.book.title === @title && x.book.author === @author}.size > 0
    render json: {message: "Book already in List"}
  else
    book = Book.create(title: @title, published_year: @published_year,description: @description, pages: @pages, book_cover: @book_cover, author: @author)
    rlb = ReadingListBook.create(reading_list: readingList, book: book)
    user = User.find(readingList.user_id)
    if user 
      if params['book']['categories']
        genre = rlb.find_genre(params['book']['categories'][0])
        rlb.genre = genre
        rlb.save
      else
        genre = rlb.find_genre(book.description)
        rlb.genre = genre
        rlb.save
      end
    end
    render json: UserSerializer.new(user).to_serialized_json
   end
  end

  def show
    byebug
  end
  
  def update
    authorization_object = Authorization.new(request)
    current_user = authorization_object.current_user
    user = User.find(current_user)
    book = Book.find(params["id"])
    rlb = ReadingListBook.find_by(book: book)
    rlb.complete(user, book)
    render json: UserSerializer.new(user).to_serialized_json
  end

  def destroy
    authorization_object = Authorization.new(request)
    current_user = authorization_object.current_user
    user = User.find(current_user)
    book = Book.find(params['id'])
    reading_list_book = ReadingListBook.find_by(book_id: book.id)
    reading_list = ReadingList.find(reading_list_book.reading_list_id)
    if user.id === reading_list.user_id
      reading_list_book.destroy
      book.destroy
      render json: UserSerializer.new(user).to_serialized_json
    else
      render json: {message: "Invalid User"}
    end
  end
end
