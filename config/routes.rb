Rails.application.routes.draw do

  
  # ユーザー
  resources 'users', except: [:show, :edit] do
    collection do
      get 'credit_register'
      get 'show'
      get 'edit'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mercaris#index'
  root 'products#new'

  # signup
  resources 'signup' do
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