# == Schema Information
#
# Table name: workshops
#
#  id          :integer          not null, primary key
#  start_date  :datetime
#  street      :string(255)
#  street2     :string(255)
#  city        :string(255)
#  state       :string(255)
#  zipcode     :string(255)
#  title       :string(255)
#  end_date    :datetime
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string(255)
#

require 'spec_helper'

describe Workshop do
  pending "add some examples to (or delete) #{__FILE__}"
end
