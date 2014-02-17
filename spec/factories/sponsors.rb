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
