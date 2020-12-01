class CreateCurrentlyReadingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :currently_reading_lists do |t|

      t.timestamps
    end
  end
end
