# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  balance         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  initial_balance :integer
#

class Account < ActiveRecord::Base
  attr_accessible :balance, :name, :user_id, :initial_balance
  has_and_belongs_to_many :users, :join_table=>'users_accounts'
  
  default_scope order: 'accounts.created_at DESC'
end
