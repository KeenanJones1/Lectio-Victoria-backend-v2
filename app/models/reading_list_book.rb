class ReadingListBook < ApplicationRecord
 belongs_to :user_reading_list
 belongs_to :book
end
