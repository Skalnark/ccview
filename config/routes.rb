Rails.application.routes.draw do
  root 'home#Index'
  get 'home/About'
  devise_for :users
  resources :clinic_cases
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
