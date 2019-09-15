Rails.application.routes.draw do

  
  # ユーザー
  resources 'users', except: [:show, :edit] do
    collection do
      get 'credit_register'
      get 'show'
      get 'edit'
      get 'logout'
      get 'edit_profile'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mercaris#index'

  # products
  resources 'products'
  root 'products#new'

  get "/signin" => "signup#signin"

  resources :signup ,only: [:index] do
    collection do
      get 'registration'
      post 'first_validation'
      get 'sms_authentication' 
      get 'adress' 
      post 'second_validation'
      get 'creditcard'
      get 'done'
    end
  end
end
