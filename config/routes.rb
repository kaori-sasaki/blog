Rails.application.routes.draw do
  
  resources :feeds
  resources :contacts
  get 'sessions/new'

  get '/', to:'tops#index'
  resources :blogs do
    resources :comments
    collection do
      post :confirm
   end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
  get '/sessions',to:'sessions#new'
if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener'
end
end
