Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  # 管理者用のルート
namespace :admin do
  root "dashboard#index"
  get :dashboard, to: 'dashboard#index', as: :dashboard

  get 'login' => 'admins#new', :as => :login
  post 'login' => "admins#create"
  delete 'logout' => 'admins#destroy', :as => :logout

  resources :happies, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :unhappies, only: [:index, :new, :create, :edit, :update, :destroy]
end

root 'static_pages#top'
get 'static_pages/show'
post 'static_pages/random_word', to: 'static_pages#random_word'
get 'static_pages/unhappy', to: 'static_pages#unhappy'
post 'static_pages/random_unhappy_word', to: 'static_pages#random_unhappy_word'

end
