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

require 'spec_helper'

describe Transaction do
  pending "add some examples to (or delete) #{__FILE__}"
end
