Rails.application.routes.draw do
  resources :learning_paths do
    member do
      post 'align_courses', to: 'learning_paths#align_courses'
    end
  end

  resources :talents do
    resources :course_talent_enrollments, only: [:index] 
  end

  post '/course_talent_enrollments/:id/change_status', to: 'course_talent_enrollments#change_status'
 
  resources :courses do
    member do
      post 'add_authors', to: 'courses#add_authors'
    end
  end  
end
