Simplemanagement::Application.routes.draw do
  # root :to => 'welcome#index'

  resources :vendors,      only: [:index, :show]
  resources :bills,        only: [:index, :show, :create]
  resources :transactions, only: [:index, :show]

  post "upload/transactions" => "upload#transactions"

end
