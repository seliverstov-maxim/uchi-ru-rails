module CommentRepository
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order(id: :desc) }
  end
end
