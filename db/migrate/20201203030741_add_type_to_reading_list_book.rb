class AddTypeToReadingListBook < ActiveRecord::Migration[6.0]
  def change
    add_column :reading_list_books, :type, :string
  end
end
