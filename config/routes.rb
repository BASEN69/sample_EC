Rails.application.routes.draw do


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do

    resources :orders, only: [:destroy, :index, :show]
    resources :addresses
    resources :items, only: [:new, :index, :create, :edit, :update, :destroy, :show]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :customers, only: [:index, :show, :edit, :update] 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :public do

    devise_for :customers, skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }
    root to: 'homes#top'
    resources :items, only: [:index, :show]
    resources :genres, only: [:show]
    get '/mypage', to: 'customers#my_page', as: 'mypage'
    #論理的退会のルートが以下
    resources :customers do
      member do
        patch :withdraw
      end
    end

  end
end
