FactoryGirl.define do
  factory :user_base, class: User do
    email { generate :email }

    factory :user do
      password_digest { BCrypt::Password.create('pass') }
    end

    factory :registration_user, parent: :user, class: Web::RegistrationUserType do
      password 'pass'
      password_confirmation 'pass'
    end

    factory :auth_user, parent: :user, class: Web::AuthUserType do
      password 'pass'
    end
  end
end
