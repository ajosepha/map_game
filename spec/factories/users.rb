FactoryGirl.define do
  factory :user do
    password "password"
    sequence(:user_name) {|n| "Mapsy#{n}@example.com"}
    sequence(:email) {|n| "mapsy#{n}@example.com"}
    twitter "@tehrealmapsy"
  end
end