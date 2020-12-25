Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :subscribers, only: [:create]
  resources :posts, path: 'p', only: [:create, :show, :edit]
  get 'write' => 'posts#new'
  resources :favorites, only: [:create]
  get 'subscribers/welcome'
  root 'welcome#index'
end
