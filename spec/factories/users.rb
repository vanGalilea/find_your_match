FactoryGirl.define do
  factory :user do
    email    { Faker::Internet.email }
    encrypted_password { Faker::Internet.encrypted_password }
    admin   { Faker::Boolean.boolean(0.2) }
  end
end
