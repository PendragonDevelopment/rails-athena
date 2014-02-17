# == Schema Information
#
# Table name: sponsors
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  website           :string(255)
#  phone             :string(255)
#  street            :string(255)
#  street2           :string(255)
#  city              :string(255)
#  state             :string(255)
#  zipcode           :string(255)
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  slug              :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sponsor do
    name "MyString"
    website "MyString"
    phone "MyString"
    street "MyString"
    street2 "MyString"
    city "MyString"
    state "MyString"
    zipcode "MyString"
    logo ""
    description "MyText"
  end
end
