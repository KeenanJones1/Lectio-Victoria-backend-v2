class User < ApplicationRecord
 has_secure_password
 has_secure_password :recovery_password, validations: false
 validates :username, uniqueness: true, presence: true
 validates :email, uniqueness: true 
 validates_confirmation_of :password
 attr_accessor :password_confirmation
 has_many :reading_lists, dependent: :destroy
 after_create :create_defaults
 has_many :reading_list_books, through: :reading_lists
 has_one_attached :avatar
 has_many :stats
 


 def create_defaults
  ReadingList.create(name: 'Currently Reading', type: 'CurrentlyReading', user: self)
  ReadingList.create(name: 'To Read List', type: 'ToRead', user: self)
  ReadingList.create(name: 'Books Read', type: 'DoneReading', user: self )

  Stat.create(name:"Nature", level:1, value: 0, user: self, goal: 100)
  Stat.create(name:"Sound", level:1, value: 0, user: self, goal: 100)
  Stat.create(name:"Reason", level:1, value: 0, user: self, goal: 100)
  Stat.create(name:"Life", level:1, value: 0, user: self, goal: 100)
  Stat.create(name:"People", level: 1, value: 0, user: self, goal: 100)
  Stat.create(name:"Body", level:1, value: 0, user: self, goal: 100)
  Stat.create(name:"Word", level:1, value: 0, user: self, goal: 100)
  Stat.create(name:"Self", level:1, value: 0, user: self, goal: 100)
  Stat.create(name:"Picture", level:1, value: 0, user: self, goal: 100)
 end

end
