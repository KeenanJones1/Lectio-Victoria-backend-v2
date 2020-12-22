class Book < ApplicationRecord
 has_one_attached :book_cover
 has_many :categories
 attr_accessor :title, :author, :published_year, :description, :pages, :book_cover

 def initialize(params_object)
  p "Hello stop"
  
  @author = params_object['volumeInfo']['authors'].map { |i| i.to_s }.join(",")

  @title = params_object['volumeInfo']['title']
  @published_year = params_object['volumeInfo']['publishedDate']
  @description = params_object['volumeInfo']['description']
  @pages = params_object['volumeInfo']['pageCount']
  @book_cover = params_object['volumeInfo']['imageLinks']['thumbnail']
  # method to calculate genre here and choose which intelligence it acounts to.
  
 end


 def process(snippet, description)
  # this method creates a book from the external api
  byebug
 end

 def calc_stats
  # this method calc the avaible stat points for a instance of a book
 end

end
