MailLinks::Application.routes.draw do
  root to: 'pages#index'
 
  resources :mails, only: [:index, :show, :create]
  resources :users, only: [:new, :create]
  
  resource :session, only: [:new, :create, :destroy] do
    match 'persona' => 'sessions#create_with_persona', as: 'persona', via: :post
  end
end
