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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :application do
    user nil
    workshop nil
    experience_level "MyText"
    previous_experience "MyText"
    rails_experience "MyString"
    good_candidate "MyText"
    why_rails "MyText"
    questions "MyText"
  end
end
