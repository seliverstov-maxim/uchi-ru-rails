class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :email, email_format: true

end
