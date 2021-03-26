Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :restaurants, param: :slug
      resources :reviews, only: [:create]
      resources :images, only: [:create]
    end
end
get '*path', to: 'pages#index', via: :all
end