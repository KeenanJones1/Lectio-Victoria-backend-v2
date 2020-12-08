class CurrentBook < ReadingListBook
 



 def finished
  book_id = self.book_id
  user = self.reading_list.user
  lists = user.reading_lists
  read_list = lists.find_by(name: "Books Read")
  ReadingListBook.create(reading_list:read_list , book_id: book_id, type: 'ReadBook' ) 
 # stat editing goes here
  self.destroy
 end

end
