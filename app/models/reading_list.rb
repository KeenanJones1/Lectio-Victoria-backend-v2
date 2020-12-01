class ReadingList < ApplicationRecord
 has_many :reading_list_books 
 has_many :books, through: :reading_list_books
 
end
