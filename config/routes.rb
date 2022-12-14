Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static_pages#top'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    } 
  
  # 管理者の新規作成とログイン
  devise_for :admin_users, controllers: {
    registrations: 'admin_users/registrations',
    sessions: 'admin_users/sessions'
  }
  
  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  # 管理者のルーティングを簡素化
  devise_scope :admin_user do
    get "admin/signup", :to => "admin_users/registrations#new"
    get "admin/login", :to => "admin_users/sessions#new"
    get "admin/logout", :to => "admin_users/sessions#destroy"
  end

  resources :admin_users, only:[:show] do
    resources :users, only:[:index, :show] 

    resources :folders do

      member do
        get "randam"
      end

    end
     
    resources :questions

  end
  
  # 退会についてのeditとupdate的なアクション
  # asで好きなルーティングヘルパーに設定
  get "admin_users/:admin_user_id/users/:id/unsubscribe" => "users#unsubscribe", as: 'confirm_unsubscribe'
  patch "admin_users/:admin_user_id/users/:id/withdraw" => "users#withdraw", as: 'withdraw_user'



  
end
