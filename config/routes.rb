Rails.application.routes.draw do
  root 'web/welcome#show'

  scope module: :web do
    resource :welcome, only: [:show]
    resource :user
    resource :session, only: [:new, :create, :destroy]
  end
end
