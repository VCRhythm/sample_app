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

require 'spec_helper'

describe Adjustment do
  pending "add some examples to (or delete) #{__FILE__}"
end
