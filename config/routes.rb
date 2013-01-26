Simplemanagement::Application.routes.draw do
  root :to => 'home#index'

  resources :vendors, only: [:index, :show, :edit, :update] do
    resources :transactions, only: [] do
      member do
        post :create_bill
      end
    end
  end

  resources :bills, only: [:index, :show, :create] do
    resources :transactions, only: [] do
      member do
        put :attach
      end
    end
  end

  get "transactions/unattached" => "transactions#unattached"
  resources :transactions, only: [:index, :show]

  post "upload/transactions" => "upload#transactions"

end
