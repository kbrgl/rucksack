Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :writers

  resources :subscribers, only: %i[create destroy]
  resources :posts, path: 'p'
  resources :favorites, only: :create
  resource :dashboard, only: :show
  resource :newsletter, only: :update

  match '/writers/:id/approve' => 'writers#approve', via: %i[post delete], as: :approve_writer
  resources :writers, only: :destroy

  get 'write' => 'posts#new'
  get 'about' => 'welcome#about', as: :about
  root 'welcome#index'
end
