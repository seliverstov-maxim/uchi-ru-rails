class Web::RegistrationUserType < User
  attr_accessor :password, :password_confirmation

  include BaseType
  include PasswordManipulation

  validates :password, presence: true
  validates :password, confirmation: true
end
