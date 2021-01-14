class Book < ApplicationRecord
 has_many :categories



 def process(snippet, description)
  # this method creates a book from the external api
  byebug
 end

 def calc_stats
  # this method calc the avaible stat points for a instance of a book
 end

end
