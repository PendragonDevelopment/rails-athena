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
