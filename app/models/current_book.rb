class CurrentBook < ReadingListBook
 validate :limit_currently_reading_list, on: :create

  def limit_currently_reading_list
   user = ReadingList.find(self.reading_list_id).user
   lists = user.reading_lists.filter {|l| l.type === self.type }
   if lists.size >= 3 do
    self.errors.add(:base, 'Only allowed a single Read Books list')
   end
  end

end
