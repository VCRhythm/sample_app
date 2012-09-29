class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.string :name
      t.string :description
      t.integer :transaction_id

      t.timestamps
    end
    add_index :flows, :transaction_id
  end
end
