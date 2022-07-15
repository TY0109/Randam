Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static_pages#top'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    } 
  
  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  resources :users, only:[:index, :show] 

  resources :questions
    

  
end
