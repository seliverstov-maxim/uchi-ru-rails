module BaseType
  extend ActiveSupport::Concern

  included do
    def model_name
      self.class.superclass.model_name
    end
  end
end
