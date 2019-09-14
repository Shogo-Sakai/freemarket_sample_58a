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
  resources :signup do
    collection do
      get 'signup' 
      get 'signin'
      get 'first'
      get 'second' 
      get 'third' 
      get 'fourth'
      get 'fifth'
    end
  end
end
