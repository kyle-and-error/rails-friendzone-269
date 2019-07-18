Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events, only: [:index, :show, :new, :create] do
    resources :potential_attendees, only: [:index, :new, :create, :destory]
    get "potential_attendees/:id/accept", to: 'potential_attendees#update', as: :accept_request
    get "potential_attendees/:id/reject", to: 'potential_attendees#update', as: :reject_request

  end
  resources :potential_attendees, only: :show

  get "users/:user_id/potential_attendees", to: 'potential_attendees#user_requests', as: :user_requests

end
