# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "person#{n}" }
    sequence(:email) {|n| "person#{n}@test.com" }
    password '12345678'
  end
end
