class ReadingListBook < ApplicationRecord
  belongs_to :reading_list
  belongs_to :book
  validate :limit_currently_reading_list, on: :create

  def limit_currently_reading_list
   user = ReadingList.find(self.reading_list_id).user
   list = user.reading_list_books.filter {|l| l.type === 'CurrentBook' }
   if list.size >= 3 && self.type === 'CurrentBook'
    self.errors.add(:base, 'Only three books allowed in this list')
   end
  end
  
end
