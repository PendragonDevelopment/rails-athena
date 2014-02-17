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
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workshop do
    start_date "2014-02-17 14:59:04"
    street "MyString"
    street2 "MyString"
    city "MyString"
    state "MyString"
    zipcode "MyString"
    title "MyString"
    end_date "2014-02-17 14:59:04"
    description "MyText"
  end
end
