Rails.application.routes.draw do
  devise_for :admins, controllers:{
    sessions: 'admins/sessions'
  }

  devise_for :customers, skip: 'registrations'
  devise_scope :customer do
    get 'customers/sign_up', :to => 'customers/registrations#new'
    post 'customers/sign_up', :to => 'customers/registrations#create'
  end


  scope module: :public do
    root to:'homes#top'
    get 'homes/about' => 'homes#about'
    resource :customers,only:[:update]
      get 'customers/edit_page' => 'customers#edit'
      get 'customers/mypage' => 'customers#mypage'
      get 'customers/check' => 'customers#check'
      patch 'customers/withdraw' => 'customers#withdraw'
    resources :items,only:[:index,:show]
     delete 'cart_items/empty' => 'cart_items#empty'
    resources :cart_items,except:[:new,:show,:edit]
        get 'orders/complete' => 'orders#complete'
    resources :orders,only:[:new,:create,:index,:show]
      post 'orders/confirm' => 'orders#confirm'
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
