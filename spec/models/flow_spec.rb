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

require 'spec_helper'

describe Flow do
  pending "add some examples to (or delete) #{__FILE__}"
end
