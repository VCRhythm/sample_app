# == Schema Information
#
# Table name: adjustments
#
#  id         :integer          not null, primary key
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#  user_id    :integer
#

class Adjustment < ActiveRecord::Base
  attr_accessible :value, :name
  belongs_to :user
end
