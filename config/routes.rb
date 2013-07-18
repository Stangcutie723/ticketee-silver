Ticketee::Application.routes.draw do
  devise_for :users
    root :to => "project#index"
    resources :projects do
      resources :tickets
    end
  end
  namespace :admin do
    root :to => "base#index"
    resources :users
  end
end
