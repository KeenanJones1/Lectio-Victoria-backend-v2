class ReadingList < ApplicationRecord
  belongs_to :user
  has_many :reading_list_books , dependent: :destroy
  validates :name, uniqueness: true
  validate :currently_reading_validation
  validate :have_read_list_validation

  def have_read_list_validation
    user_reading_lists = ReadingList.select{|d| d.user.id === self.user_id  && d.type === 'ReadBook'}

    if user_reading_lists.size > 0 && self.type === 'ReadBook'
      self.errors.add(:base, 'Only allowed a single Read Books list')
    end
  end
  

  def currently_reading_validation
   user_reading_lists = ReadingList.select{|d| d.user.id === self.user_id  && d.type === 'CurrentlyReading'}
   
    if user_reading_lists.size > 0 && self.type === 'CurrentlyReading'
      self.errors.add(:base, 'Only allowed a single currently reading list')
    end
  end

end
