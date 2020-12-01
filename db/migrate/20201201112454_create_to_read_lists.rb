class CreateToReadLists < ActiveRecord::Migration[6.0]
  def change
    create_table :to_read_lists do |t|

      t.timestamps
    end
  end
end
