Rails.application.routes.draw do
  
  resources :dictionaries
  get 'home/administration'
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
	get 'dictionaries/Index'
	post 'home/tornar_professor'
	post 'home/tornar_estudante'
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
