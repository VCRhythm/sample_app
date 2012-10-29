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
  attr_accessible :balance, :name, :initial_balance, :owner
  has_many :priorities, dependent: :destroy

  has_many :users, through: :priorities
  has_many :transactions, through: :users
  has_many :adjustments, through: :users
 
  default_scope order: 'accounts.created_at DESC'
  
  def registered?(user_id)
    users.find_by_id(user_id)
  end
  
end
