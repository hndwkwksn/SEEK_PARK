Rails.application.routes.draw do
  # 顧客用
  # URL /end_users/sign_in ...
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "end_user/registrations",
    sessions: 'end_user/sessions'
  }

  scope module: :end_user do
    root :to =>"homes#top"
    get '/end_users/unsubscribe' => 'end_users#unsubscribe'
    patch '/end_users/withdraw' => 'end_users#withdraw'
    resources :end_users, only: [:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]  # 単数形にすると、/:idがURLに含まれなくなる。
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :parks, only: [:new,:index,:create,:show,:edit,:update,:destroy] do
      resources :park_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]  # 単数形にすると、/:idがURLに含まれなくなる。
    end
  end


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

   namespace :admin do
    patch '/end_users/withdraw' => 'end_users#withdraw'
    resources :end_users, only: [:index,:edit,:update]
    resources :parks, only: [:edit,:destroy]
    get "search" => "searches#search"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
