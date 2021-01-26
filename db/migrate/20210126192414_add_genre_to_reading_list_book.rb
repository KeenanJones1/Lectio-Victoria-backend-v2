class AddGenreToReadingListBook < ActiveRecord::Migration[6.0]
  def change
    add_column :reading_list_books, :genre, :string
  end
end
