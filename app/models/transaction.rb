# == Schema Information
#
# Table name: transactions
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  flow_id          :integer
#  transaction_date :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  value            :float
#  description      :text
#

class Transaction < ActiveRecord::Base
  attr_accessible :transaction_date, :flow_id, :user_id, :value, :description
  
  belongs_to :user
  belongs_to :flow
  
  validates :transaction_date, presence: true
  validates :user_id, presence: true
  validates :flow_id, presence: true
  validates_uniqueness_of :flow_id, :scope => :transaction_date
  default_scope order: 'transactions.transaction_date DESC'
end
