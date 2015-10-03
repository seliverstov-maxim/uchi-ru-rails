module GistRepository
  extend ActiveSupport::Concern

  included do
    scope :public_only, -> { where(public: true) }
    scope :ordered, -> { order(id: :desc) }
  end
end
