FactoryGirl.define do
  pw = RandomData.random_sentence
  # declare the name of factory for user
  factory :user do
    name RandomData.random_name
# each User that the factory will build wil lhave a unique email using sequences
    sequence(:email){|n| "user#{n}@factory.com" }
    password pw
    password_confirmation pw
    role :member
  end
end
