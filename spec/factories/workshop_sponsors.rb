# == Schema Information
#
# Table name: workshop_sponsors
#
#  id          :integer          not null, primary key
#  sponsor_id  :integer
#  workshop_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workshop_sponsor do
    sponsor nil
    workshop nil
  end
end
