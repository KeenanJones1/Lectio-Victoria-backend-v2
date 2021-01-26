class Book < ApplicationRecord
 has_many :categories






 def calc_stats
  # this method calc the avaible stat points for a instance of a book
 end

end
