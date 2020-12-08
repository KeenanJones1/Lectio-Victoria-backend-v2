require 'faker'

User.destroy_all
Book.destroy_all
ReadingList.destroy_all
ReadingListBook.destroy_all

keenan = User.create(username:'Keenan1', email:'keenan@example.com', password_digest:'first123!')



walden = Book.create(author: "Walden Michaels", pages: 215, genre: "self reflection", description: "There once was a man from nantucket", published_year: 2001, title:"Walden")

harry = Book.create(author: "Harry Michaels", pages: 215, genre: "self reflection", description: "There once was a man from nantucket", published_year: 2001, title:"Harry")

# create 10 tickets in DB
(1..10).each do |id|
 Book.create!(
# we have userIds between 1 and 20. Assign a ticket to a user 
# randomly
     title: Faker::Book.title, 
     pages: 300,
     author: Faker::Book.author,
# generate a fake paragraph
     genre: Faker::Book.genre,
     published_year: 2001,
     description: Faker::Books::Lovecraft.paragraph(sentence_count: 3)
 )
end





keenan_list = ReadingList.create(name: 'Summer Reading', type: 'ToRead', user: keenan)


(1..5).each do 
 user_book = ReadingListBook.create(reading_list: keenan_list, book_id: rand(1..10), type: 'CurrentBook' )
 byebug
end

# keenan_walden = ReadingListBook.create(reading_list: keenan_list, book: walden, type: 'CurrentBook' )

# book1 = ReadingListBook.create(reading_list: keenan_list, book: walden, type: 'CurrentBook' )
# book2 = ReadingListBook.create(reading_list: keenan_list, book: walden, type: 'CurrentBook' )
# book3 = ReadingListBook.create(reading_list: keenan_list, book: walden, type: 'CurrentBook' )


# Add functionality to create Currently reading Book. 
# 

