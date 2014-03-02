# == Schema Information
#
# Table name: agenda_items
#
#  id             :integer          not null, primary key
#  application_id :integer
#  start          :datetime
#  end_time       :datetime
#  title          :string(255)
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agenda_item do
    application nil
    start "2014-03-01 19:41:55"
    end_time "2014-03-01 19:41:55"
    title "MyString"
    description "MyText"
  end
end
