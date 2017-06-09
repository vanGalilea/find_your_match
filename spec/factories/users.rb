FactoryGirl.define do
  factory :user do
    email    { Faker::Internet.email }
    password { Faker::Internet.password }
    matched_user_ids []

    trait :student do
          admin false
        end

    trait :admin do
      admin true
    end

  end

end
