Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    passwords: "users/passwords"
  }

  resources :users, only: [ :show, :edit, :update ] do
    resources :cats, only: [ :new, :create, :edit, :update, :show, :destroy ]
  end

  resources :cats, only: [ :index ]

  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  post "logout", to: "sessions#destroy", as: "logout"

  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "terms_of_service" => "terms_of_service#index"
  get "privacy_policies" => "privacy_policies#index"
  get 'images/ogp.png', to: 'images#ogp', as: 'images_ogp'
  get '/ogp2/:id.png', to: 'ogp_creator#build'
  get 'ogp_image/:cat_id', to: 'images#ogp', as: 'ogp_image'



  resources :feeding_calculation, only: [ :new ] do
    collection do
      post :calculate # 計算を行う
      post :save      # 結果を保存 (ログインユーザーのみ)
      get :calculate
    end
    member do
      delete :destroy
    end
  end

  resources :brands, only: [ :index, :show ] do
    member do
      get :foods # /brands/:id/foods に対応
    end

    collection do
      get :autocomplete
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
      match "confirm", via: [ :get, :post ]
      post "back"
      get "done"
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"
end
