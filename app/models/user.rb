class User < ApplicationRecord
 has_secure_password
 has_secure_password :recovery_password, validations: false
 validates :username, uniqueness: true, presence: true
 validates :email, uniqueness: true 
 validates_confirmation_of :password
 attr_accessor :password_confirmation
 has_many :reading_lists, dependent: :destroy
 after_create :create_default_lists
 has_many :reading_list_books, through: :reading_lists
 has_one_attached :avatar
 


 def create_default_lists
  ReadingList.create(name: 'Currently Reading', type: 'CurrentlyReading', user: self)
  ReadingList.create(name: 'To Read List', type: 'ToRead', user: self)
  ReadingList.create(name: 'Books Read', type: 'DoneReading', user: self )
 end

end
