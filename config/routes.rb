Rails.application.routes.draw do
  root 'web/welcome#show'

  scope module: :web do
    resources :gists, only: [:index, :show] do
      resources :comments, only: [:create]
    end
    resource :welcome, only: [:show]
    resource :session, only: [:new, :create, :destroy]
    resource :user, only: [:new, :create]
    namespace :user do
      resources :gists, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end
end
