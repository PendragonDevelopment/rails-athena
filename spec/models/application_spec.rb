# == Schema Information
#
# Table name: applications
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  workshop_id         :integer
#  experience_level    :text
#  previous_experience :text
#  rails_experience    :string(255)
#  good_candidate      :text
#  why_rails           :text
#  questions           :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'spec_helper'

describe Application do
  pending "add some examples to (or delete) #{__FILE__}"
end
