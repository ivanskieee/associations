Rails.application.routes.draw do
  root "home#index"
  resources :authors, only: [ :index, :show, :create, :update, :destroy, :edit, :new ]
  resources :books, only: [ :index, :show, :create, :update, :destroy, :edit, :new ]
  resources :users, only: [ :index, :show, :create, :update, :destroy, :edit, :new ]
  resources :profiles, only: [ :index, :show, :create, :update, :destroy, :edit, :new ]
  resources :physicians
  resources :patients
  resources :appointments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
