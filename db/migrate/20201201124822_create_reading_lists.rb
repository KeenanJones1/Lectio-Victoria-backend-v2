class CreateReadingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :reading_lists do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
