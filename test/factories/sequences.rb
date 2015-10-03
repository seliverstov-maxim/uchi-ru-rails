FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@test.home"
  end

  sequence :string do |n|
    "string_#{n}"
  end
end
