class Adjustment < ActiveRecord::Base
  attr_accessible :value, :name
  belongs_to :user
end
