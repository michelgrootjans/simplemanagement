Simplemanagement::Application.routes.draw do
  # root :to => 'welcome#index'

  resources :vendors,      only: [:index, :show]
  resources :bills,        only: [:index, :show, :create] do
  	resources :transactions, only: [] do
  		member do
  			put :attach
  		end
  	end
  end
  	
  resources :transactions, only: [:index, :show]

  post "upload/transactions" => "upload#transactions"

end
