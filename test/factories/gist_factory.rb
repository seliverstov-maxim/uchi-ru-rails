FactoryGirl.define do
  factory :gist do
    description { generate :string }
    language 'sql'
    association :owner, factory: :user
  end
end
