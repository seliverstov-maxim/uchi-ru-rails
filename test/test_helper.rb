ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'wrong/adapters/minitest'

Dir[Rails.root.join("test/helpers/**/*.rb")].each { |f| require f }

class ActiveSupport::TestCase
  fixtures :all
  include FactoryGirl::Syntax::Methods
  include Wrong
  include AuthHelper

end
