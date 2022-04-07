Rails.application.routes.draw do
  devise_for :users
  get "contact/show"
  get "about/show"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "genres/index"
  get "genres/show"
  get "records/index"
  get "records/show"
  get "records/filter_new"
  get "records/filter_sale"
  resources :genres
  resources :records
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "home#index"

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  resources :records, only: %i[index show]
end
