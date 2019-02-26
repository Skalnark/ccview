Rails.application.routes.draw do
  
  devise_for :users

  resources :case_modules
  resources :topics
  resources :clinic_cases

  root 'home#Index'
  get 'home/About'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
