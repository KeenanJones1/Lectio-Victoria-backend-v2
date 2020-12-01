User.destroy_all
Book.destroy_all
ReadingList.destroy_all
UserReadingList.destroy_all
ReadingListBook.destroy_all

keenan = User.create(username:'Keenan1', email:'keenan@example.com', password_digest:'first123!')

walden = Book.create(author: "Walden Michaels", pages: 215, genre: "self reflection", description: "There once was a man from nantucket", published_year: 2001, title:"Walden")

reading_list = ReadingList.create(name: 'Summer Reading', type: 'ToReadList')

keenan_list = UserReadingList.create(user:keenan, reading_list:reading_list)

keenan_walden = ReadingListBook.create(user_reading_list: keenan_list, book: walden)


