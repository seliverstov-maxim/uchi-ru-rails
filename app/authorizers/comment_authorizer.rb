class CommentAuthorizer < ApplicationAuthorizer
  def self.creatable_by?(user)
    !user.guest?
  end
end
