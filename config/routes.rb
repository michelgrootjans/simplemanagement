Simplemanagement::Application.routes.draw do
  # root :to => 'welcome#index'

  resources :transactions, only: [:index] do
  end

  get "transactions/upload" => "transactions#upload"
  post "transactions/upload" => "transactions#do_upload"
end
