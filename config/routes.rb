Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'sessions/new'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'cusomers/show'
    get 'cusomers/edit'
    get 'cusomers/update'
    get 'cusomers/check'
  end
  namespace :public do
    get 'items/indes'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :customers

  scope module: :public do
    root to:'homes#top'
    get 'homes/about' => 'homes#about'
    resource :customers,only:[:show,:edit,:update]
      get 'customers/check' => 'customers#check'
      patch 'customers/withdraw' => 'customers#withdraw'
    resources :items,only:[:index,:show]
    resources :cart_items,except:[:new,:show,:edit]
      delete 'cart_items/empty' => 'cart_items#empty'
    resources :orders,only:[:new,:create,:index,:show]
      post 'orders/confirm' => 'orders#confirm'
      get 'orders/complete' => 'orders#complete'
    resources :addresses,except:[:show,:new]
  end
  namespace :admin do
    get '/sign_in' => 'session#new'
    post '/sign_in' => 'session#create'
    delete '/sign_out' => 'session#destroy'
    get '/' => "homes#top"
    resources :items,except:[:destroy]
    resources :genres,only:[:index,:create,:edit,:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :orders,only:[:show,:update]
    resources :order_items,only:[:update]
  end
end
