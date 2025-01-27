Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [ :show, :edit, :update ]

  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :feeding_calculation, only: [ :new ] do
    collection do
      post :calculate # 計算を行う
      post :save      # 結果を保存 (ログインユーザーのみ)
      get :calculate
    end
  end

  resources :brands, only: [ :index, :show ] do
    member do
      get :foods # /brands/:id/foods に対応
    end
  end

  resources :foods, only: [ :show ] do
    collection do
      get :bookmarks
    end
    resources :reviews, only: [ :index, :new, :create ]
  end

  # resources :reviews, only: [ :index ]

  resources :bookmarks, only: [ :create, :destroy ]

  resources :contacts, only: [ :new, :create ] do
    collection do
      post "confirm"
      post "back"
      get "done"
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
  root "feeding_calculation#new"
end
