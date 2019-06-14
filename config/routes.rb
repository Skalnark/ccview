Rails.application.routes.draw do
  
  	devise_for :users

	resources :case_modules do
		resources :topics, :name_prefix => "case_module_" do
			member do
	    		get 'show_image', as: 'image'
			end
		end

		member do
	    	get 'show_image', as: 'image'
		end
	end

	resources :topics do
		resources :clinic_cases, :name_prefix => "topic_" do
			get 'show_image/:image_id', as: 'image', to: 'clinic_cases#show_image'
			delete 'show_image/:image_id', as: 'delete_image', to: 'clinic_cases#delete_image'
		end
	end

	resources :clinic_cases
	resources :dictionaries

	root 'home#Index'
	get 'home/administration'
	get 'home/About'
	get 'dictionaries/Index'
	post 'home/tornar_professor'
	post 'home/tornar_estudante'
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
