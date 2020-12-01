class UserReadingList < ApplicationRecord
 belongs_to :user
 belongs_to :reading_list
 has_many :reading_list_books
 has_many :books, through: :reading_list_books
end
