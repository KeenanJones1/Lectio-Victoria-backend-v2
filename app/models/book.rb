class Book < ApplicationRecord
 has_one_attached :book_cover

 def process
  # this method creates a book from the external api
 end

 def calc_stats
  # this method calc the avaible stat points for a instance of a book
 end

end
