class User < ApplicationRecord
 has_secure_password
 has_secure_password :recovery_password, validations: false
 validates :username, presence: true
 validates :email, email: true 
 validates_confirmation_of :password
 attr_accessor :password_confirmation
 has_many :reading_lists, dependent: :destroy
 after_create :create_currently_reading
 has_many :reading_list_books, through: :reading_lists
 
 


 def create_currently_reading
  ReadingList.create(name: 'Currently Reading', type: 'CurrentlyReading', user: self)
 end

end
