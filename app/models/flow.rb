# == Schema Information
#
# Table name: flows
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :string(255)
#  transaction_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#

class Flow < ActiveRecord::Base
  attr_accessible :description, :name
  has_one :transaction
  has_many :users, :through => :transactions
  
  validates :name, presence: true, length: { maximum: 60 }
  validates :description, length: { maximum: 140 }
  default_scope order: 'flows.name ASC'
end
