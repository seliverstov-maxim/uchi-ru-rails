class Gist < ActiveRecord::Base
  include ::GistRepository

  belongs_to :owner, class_name: 'User'
  has_many :comments, as: :commentable, class_name: 'Comment'

  validates :owner, presence: true

  state_machine initial: :active do
    state :active do
    end

    state :deleted do
    end

    event :mark_as_deleted do
      transition :active => :deleted
    end

    event :restore do
      transition :deleted => :active
    end

    after_transition any => :deleted do |gist, transition|
      gist.update(deleted_at: Time.zone.now)
    end
  end

  include StateMachineScopes
end
