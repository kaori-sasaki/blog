Rails.application.routes.draw do
  get 'sessions/new'

  get 'relationships/create'
  get 'relationships/destroy'
  resources :relationships, only: [:create, :destroy]


  #resources :contacts


  get '/', to:'tops#index'
  resources :blogs do
    resources :comments
    collection do
      post :confirm
   end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users#, only: [:index] 
  resources :favorites, only: [:create, :destroy]
  get '/sessions',to:'sessions#new'
if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener'
end
end
