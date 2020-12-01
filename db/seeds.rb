User.destroy_all
Book.destroy_all
ReadingList.destroy_all
ReadingListBook.destroy_all

keenan = User.create(username:'Keenan1', email:'keenan@example.com', password_digest:'first123!')

walden = Book.create(author: "Walden Michaels", pages: 215, genre: "self reflection", description: "There once was a man from nantucket", published_year: 2001, title:"Walden")

keenan_list = ReadingList.create(name: 'Summer Reading', type: 'ToRead', user: keenan)



keenan_walden = ReadingListBook.create(reading_list: keenan_list, book: walden)

# Error have to do alot of digging to get to the books. 

# User.first.reading_lists.first.reading_list_books.first.book

# Add functionality to create Currently_reading List 

# Add functionality to create Currently reading Book. 


