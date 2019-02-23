Rails.application.routes.draw do
  
  devise_for :users

  authenticated :users do

      get 'users/sign_in' to: 'home#Index'
      get 'users/sign_up' to: 'home#Index'
      post 'users/sign_in' to: 'home#Index'
      post 'users/sign_in' to: 'home#Index'

	  resources :case_modules
	  resources :topics
	  resources :clinic_cases
  end

  root 'home#Index'
  get 'home/About'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
