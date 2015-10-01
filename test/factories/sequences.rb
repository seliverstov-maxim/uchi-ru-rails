FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@test.home"
  end
end
