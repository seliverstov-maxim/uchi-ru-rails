class Comment < ActiveRecord::Base
  include CommentRepository

  belongs_to :commentable, polymorphic: true
  belongs_to :owner, class_name: 'User'

  validates :commentable, presence: true
  validates :owner, presence: true
end
