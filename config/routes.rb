Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[index ]
  resources :splashes, only: %i[index ]
  # Defines the root path route ("/")
  root to: "users#index"

end
