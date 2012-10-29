class Priority < ActiveRecord::Base
  attr_accessible :account, :rank
  belongs_to :user
  belongs_to :account, dependent: :destroy
  
  default_scope order: 'priorities.rank DESC'
end
