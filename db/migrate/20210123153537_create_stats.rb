class CreateStats < ActiveRecord::Migration[6.0]
  def change
    create_table :stats do |t|
      t.string :name
      t.integer :level
      t.integer :value
      t.integer :goal
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
