Rails.application.routes.draw do
  resources :learning_paths
  resources :talents
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
