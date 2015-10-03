FactoryGirl.define do
  factory :comment, class: Gist::Comment do
    content { generate :string }
    association :owner, factory: :user
    association :gist
  end
end
