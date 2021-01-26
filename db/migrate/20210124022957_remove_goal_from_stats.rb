class RemoveGoalFromStats < ActiveRecord::Migration[6.0]
  def change
    remove_column :stats, :goal, :integer
  end
end
