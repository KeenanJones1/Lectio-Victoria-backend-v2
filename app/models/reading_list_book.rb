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

  def find_genre(desc)
    lower_desc = desc.downcase
    if lower_desc.include? "playbook"
     "Body"
    elsif lower_desc.include? "politic"
     "Reason"
    elsif lower_desc.include? "logy"
     "Reason"
    elsif lower_desc.include? "biograph"
     "People"
    elsif lower_desc.include? "authors"
     "People"
    elsif lower_desc.include? "phy"
     "Reason"
    elsif lower_desc.include? "juvenile"
     "Life"
    elsif lower_desc.include? "comic"
     "Picture"
    elsif lower_desc.include? "adventure"
     "Life"
    elsif lower_desc.include? "humor"
     "People"
    else
     byebug
     "Word"
    end
   end

   def complete(user, book)
    @base = book.pages * 0.25
    new_rl = user.reading_lists.find{|list| list.type == "DoneReading"}
    rlb = ReadingListBook.create(reading_list: new_rl, book: book, genre: self.genre, type: "ReadBook")
    stat = user.stats.find_by(name: self.genre)
    if stat.value + @base <= stat.goal
      byebug
      stat.value += @base
      stat.save
    else
      byebug
      stat.level += 1
      new_value = (stat.value + @base) - stat.goal
      stat.value = new_value
      stat.goal = (stat.goal * 0.15) + stat.goal
      stat.save
    end
    self.destroy
   end
  
end
