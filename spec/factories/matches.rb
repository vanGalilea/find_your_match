FactoryGirl.define do
  factory :match do
    user_id { Faker::Number.number(2)}
    matched_user_id { Faker::Number.number(2)}    
    created_at { Faker::Date.backward(0)}
  end
end
