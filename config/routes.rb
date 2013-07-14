Ticketee::Application.routes.draw do
  root :to => "project#index"
  resources :projects do
  resources :tickets
end
end
