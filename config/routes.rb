Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

    root 'static_pages#home'
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'  # named routes
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/my_store', to: 'stores#my_store'
    post '/update_store', to: 'stores#update_store'
    get '/create_food', to: 'foods#new'
    get '/search', to: 'static_pages#search'

    resources :users
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]
    get   '/resend_activation/:email', to: 'account_activations#resend_activation', :constraints => { :email => /[^\/]+/ }
    resources :stores
    resources :foods
    resources :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
