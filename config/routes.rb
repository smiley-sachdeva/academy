Rails.application.routes.draw do
  resources :learning_paths
  resources :talents
  resources :courses do
    member do
      post 'add_authors', to: 'courses#add_authors'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
