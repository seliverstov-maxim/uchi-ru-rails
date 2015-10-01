class Web::AuthUserType < User
  attr_accessor :password

  include BaseType
  include PasswordManipulation

  validates :password, presence: true

  def authenticate(pass)
    self.password == pass
  end
end
