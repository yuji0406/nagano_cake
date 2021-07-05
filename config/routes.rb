Rails.application.routes.draw do
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
