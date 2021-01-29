class AddGoalToStats < ActiveRecord::Migration[6.0]
  def change
    add_column :stats, :goal, :integer
  end
end
