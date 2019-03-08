Rails.application.routes.draw do
  
	devise_for :users

	resources :case_modules do
		resources :topics, :name_prefix => "case_module_"
	end

	resources :topics do
		resources :clinic_cases, :name_prefix => "topic_"
	end

	resources :clinic_cases

	root 'home#Index'
	get 'home/About'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
