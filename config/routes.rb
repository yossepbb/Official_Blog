Rails.application.routes.draw do
  namespace :admin do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
  	resources :moderators, only: [:index, :edit, :update]
  end

end
