ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'wrong/adapters/minitest'

class ActiveSupport::TestCase
  fixtures :all
  include FactoryGirl::Syntax::Methods
  include Wrong

end
