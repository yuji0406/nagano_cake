Rails.application.routes.draw do
  devise_for :customers

  scope module: :public do
    resource :customers,only:[:show,:edit,:update]
      get 'customers/check' => 'customers#check'
      patch 'customers/withdraw' => 'customers#withdraw'
    resources :items,only:[:index,:show]
    resources :sessions,only:[:new,:create,:destroy]
    resources :customers,only:[:show,:edit,:update,]
      patch 'customers/withdraw' => 'cusomers#withdraw'
      get 'cusomers/check' => 'cusomers#check'
    resources :cart_items,except:[:new,:show,:edit]
      delete 'cart_items/empty' => 'cart_items#empty'
    resources :orders,only:[:new,:create,:index,:show]
      post 'orders/confirm' => 'orders#confirm'
      get 'orders/complete' => 'orders#complete'
    resources :addresses,except:[:show,:new]
  end

end
