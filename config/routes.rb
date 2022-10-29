Rails.application.routes.draw do
  get  resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  get  resources :orders, only:[:new, :confirm, :thanks, :create, :index, :show]
  get  resources :cart_items, only:[:index, :update, :destroy, :all_destroy, :create]
  get  resources :customers, only:[:show, :edit, :update, :quit, :withdrawl]
  get  resources :items, only:[:index, :show]
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'

  namespace :admin do
    get 'orders/show'
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
