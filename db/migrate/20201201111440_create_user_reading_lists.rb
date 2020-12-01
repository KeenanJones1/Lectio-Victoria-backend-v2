class CreateUserReadingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :user_reading_lists do |t|
      t.integer :user_id
      t.integer :reading_list_id

      t.timestamps
    end
  end
end
