class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.integer :user_id
      t.integer :account_id
      t.integer :rank

      t.timestamps
    end
  end
end
