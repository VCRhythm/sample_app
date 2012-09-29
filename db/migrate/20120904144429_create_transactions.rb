class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :flow_id
      t.date :transaction_date

      t.timestamps
    end
  add_index :transactions, :user_id
  add_index :transactions, :flow_id
  
  end
end
