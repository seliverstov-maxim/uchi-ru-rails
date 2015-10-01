class Web::ApplicationController < ApplicationController
  include Web::AuthService

  layout 'superhero'

  helper_method :current_user
end
