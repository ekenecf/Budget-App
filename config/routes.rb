Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[index ]
  resources :splashes, only: %i[index ]

  resources :users, only: %i[index ] do
    resources :groups, only: %i[index new show create destroy]
    resources :deals, only: %i[index new show create destroy]
  end

  root to: "users#index"
end
