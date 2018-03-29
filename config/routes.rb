Rails.application.routes.draw do
  root "todo_lists#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todo_lists do
  	resources :todo_items do
  		member do
  			patch :complete
  		end
  	end
  end
  
  get 'notifications' => 'notification#notification'
  delete 'notification/:id' => 'notification#destroy', as: :notification
  put '/notification' => 'notification#refresh', as: :notification_refresh

end
