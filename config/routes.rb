Rails.application.routes.draw do
  get 'addresses/index'
  get 'addresses/edit'
  get 'orders/new'
  get 'orders/thanks'
  get 'orders/idex'
  get 'orders/show'
  get 'cart_items/index'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/quit'
  get 'items/index'
  get 'items/show'
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'

  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
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
