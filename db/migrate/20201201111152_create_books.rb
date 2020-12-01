class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :published_year
      t.string :genre
      t.text :description
      t.integer :pages

      t.timestamps
    end
  end
end
