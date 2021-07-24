Rails.application.routes.draw do
  devise_for :admins, controllers:{
    sessions: 'admins/sessions'
  }
   devise_scope :admins do
    get "sign_in", :to => "admins/sessions#new"
    get "sign_out", :to => "admins/sessions#destroy" 
  end
  
  devise_for :customers

  scope module: :public do
    root to:'homes#top'
    get 'homes/about' => 'homes#about'
    resource :customers,only:[:edit,:update]
      get 'customers/mypage' => 'customers#show'
      get 'customers/check' => 'customers#check'
      patch 'customers/withdraw' => 'customers#withdraw'
    resources :items,only:[:index,:show]
     delete 'cart_items/empty' => 'cart_items#empty'
    resources :cart_items,except:[:new,:show,:edit]
    resources :orders,only:[:new,:create,:index,:show]
      post 'orders/confirm' => 'orders#confirm'
      get 'orders/complete' => 'orders#complete'
    resources :addresses,except:[:show,:new]
  end
  namespace :admin do
     get '/' => "homes#top"
    resources :items,except:[:destroy]
    resources :genres,only:[:index,:create,:edit,:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :orders,only:[:show,:update]
    resources :order_items,only:[:update]
  end
end
