Rails.application.routes.draw do
  resources :clinic_cases
  devise_for :users
  get 'home/index', to: 'home#index'
  root 'clinic_cases#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
