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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workshop_user do
    user nil
    workshop nil
  end
end
