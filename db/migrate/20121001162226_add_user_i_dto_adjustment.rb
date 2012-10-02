class AddUserIDtoAdjustment < ActiveRecord::Migration
  def up
    add_column :adjustments, :user_id, :integer
  end

  def down
    remove_column :adjustments, :user_id
  end
end
