class CreateUsersAccountsJoinTable < ActiveRecord::Migration
  def change
    create_table :users_accounts, :id => false do |t|
      t.integer :user_id
      t.integer :account_id
    end
  end
end
