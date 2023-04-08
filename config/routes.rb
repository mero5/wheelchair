Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:passwords] , controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index,:show,:edit,:update]
    resources :items
    resources :categories, only: [:index, :edit, :create, :update, :destroy]
  end

  scope module: :public do
    get 'customers/profile' => 'customers#show'
    patch 'customers/profile' => 'customers#update'
    get 'customers/profile/edit' => 'customers#edit'
    get 'customers/unsubscribe'
    patch 'customers/withdrawal'
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
  end

  root to: "homes#top"
  get 'about' => "homes#about"

end
