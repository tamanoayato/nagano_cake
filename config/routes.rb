Rails.application.routes.draw do

  resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  resources :orders, only:[:new, :confirm, :thanks, :create, :index, :show]
  resources :cart_items, only:[:index, :update, :destroy, :all_destroy, :create]
  get 'customers/mypage' => 'customers#show', as: 'customer_mypage'
  get 'customers/mypage/edit' => 'customers#edit', as: 'customer_mypage_edit'
  patch 'customer_mypage' => 'customers#update', as: 'update_customer_mypage'
  resources :customers, only:[:quit, :withdrawl]
  resources :items, only:[:index, :show]
  root to: "homes#top"
  get '/about' => 'homes#about', as: 'about'

  namespace :admin do
    resources :orders, only:[:show, :update]
  end
  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :genres, only:[:new, :index, :create, :edit, :update]
  end

  namespace :admin do
    resources :items, only:[:new, :index, :create, :show, :edit, :update]
  end

  namespace :admin do
    root to: "homes#top"
  end
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
