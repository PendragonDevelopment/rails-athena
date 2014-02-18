# == Schema Information
#
# Table name: workshop_users
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  workshop_id   :integer
#  workshop_role :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe WorkshopUser do
  pending "add some examples to (or delete) #{__FILE__}"
end
