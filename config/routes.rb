Rails.application.routes.draw do
  resources :case_picture_relationships
  resources :question_answer_relationships
  resources :student_class_relationships
  resources :class_module_relationships
  resources :professor_module_relationships
  resources :questions
  resources :pictures
  resources :answers
  resources :clinical_cases
  resources :case_modules
  resources :student_classes
  resources :professors
  resources :students
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
