class CreateReadingListBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :reading_list_books do |t|
      t.integer :reading_list_id
      t.integer :book_id

      t.timestamps
    end
  end
end
