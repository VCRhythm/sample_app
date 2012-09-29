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

require 'spec_helper'

describe Account do
  pending "add some examples to (or delete) #{__FILE__}"
end
