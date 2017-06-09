FactoryGirl.define do
  factory :user do
    email    { Faker::Internet.email }
    encrypted_password { Faker::Internet.password(8) }
    matched_user_ids []

    trait :student do
          admin false
        end

    trait :admin do
      admin true
    end

  end

end
