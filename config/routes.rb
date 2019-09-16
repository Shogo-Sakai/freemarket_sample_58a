Rails.application.routes.draw do

  
  # ユーザー
  resources 'users', except: [:show, :edit] do
    collection do
      get 'credit_register'
      get 'show'
      get 'edit'
      get 'logout'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mercaris#index'

  # products
  resources 'products'

  # signup
  get '/signin' => 'signup#signin'
  resources 'signup' do
    collection do
      get 'registration'
      get 'sms_authentication'
      get 'adress'
      get 'creditcard'
      get 'done'
    end
  end
end
