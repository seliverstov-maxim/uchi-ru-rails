class User < ActiveRecord::Base
  include UserRepository

  has_many :gists, foreign_key: 'owner_id'

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :email, email_format: true

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
