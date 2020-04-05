Rails.application.routes.draw do
  devise_for :users
  
  root 'mains#index'
  resources :products, only: [:index, :new, :show, :create] do
    resources :reviews, only: [:new, :create, :destroy, :show, :edit, :update] do
      resources :comments, only: [:new, :create, :destroy, :show, :edit, :update]
    end
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
  resources :top, only: :index
end
