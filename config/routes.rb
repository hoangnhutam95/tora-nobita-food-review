Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

    root 'static_pages#home'
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'  # named routes
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    resources :users
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]
    get   '/resend_activation/:email', to: 'account_activations#resend_activation', :constraints => { :email => /[^\/]+/ }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
