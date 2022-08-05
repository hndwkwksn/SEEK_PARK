Rails.application.routes.draw do
  # 顧客用
  # URL /end_users/sign_in ...
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "end_user/registrations",
    sessions: 'end_user/sessions'
  }

  scope module: :end_user do
    root :to =>"homes#top"
  end


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
