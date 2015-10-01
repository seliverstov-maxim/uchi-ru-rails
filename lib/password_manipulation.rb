module PasswordManipulation
  extend ActiveSupport::Concern
  include BCrypt

  included do

    def password
      @password ||= BCrypt::Password.new(password_digest)
    end

    def password=(new_password)
      @password = BCrypt::Password.create(new_password)
      self.password_digest = @password
    end
  end
end
