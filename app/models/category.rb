class Category < ApplicationRecord
 belongs_to :book

 def initialize(snippet, description, book)
  byebug
 end


end
