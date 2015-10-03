FactoryGirl.define do
  factory :gist do
    description { generate :string }
    association :owner, factory: :user
  end
end
