class ReadingList < ApplicationRecord
  belongs_to :user
  has_many :reading_list_books
end
