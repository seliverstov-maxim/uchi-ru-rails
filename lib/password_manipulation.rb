module PasswordManipulation
  extend ActiveSupport::Concern
  include BCrypt

  included do

    def password
      return if password_digest.blank?
      @password ||= BCrypt::Password.new(password_digest)
    end

    def password=(new_password)
      return if new_password.blank?
      @password = BCrypt::Password.create(new_password)
      self.password_digest = @password
    end
  end
end
