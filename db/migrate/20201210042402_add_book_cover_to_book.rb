class AddBookCoverToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :book_cover, :string
  end
end
