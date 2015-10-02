Rails.application.routes.draw do
  root 'web/welcome#show'

  scope module: :web do
    resource :welcome, only: [:show]
    resource :session, only: [:new, :create, :destroy]
    resources :gists, only: [:index, :show]
    resource :user do
      resources :gists
    end
  end
end
