class User < ApplicationRecord
 has_secure_password
 has_secure_password :recovery_password, validations: false
 validates :username, presence: true
 validates :email, email: true 
 validates_confirmation_of :password
 attr_accessor :password_confirmation
 has_many :user_reading_lists
 has_many :reading_lists, through: :user_reading_lists
 has_one :currently_reading_list, as: :currently_reading
 
 has_many :reading_list_books, through: :reading_lists
 
end
