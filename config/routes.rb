Rails.application.routes.draw do

  get 'properties/index'

  get 'properties/show'

  get 'properties/new'

  get 'properties/create'

  get 'properties/delete'

  get 'properties/edit'

  root                    'landing_page#landing'
  # get 'home'               => 'static_pages#home'
  get 'home'               => 'static_pages#company'
  get 'companies'          => 'static_pages#company'
  get 'schedule'           => 'static_pages#schedule'
  get 'manual'             => 'static_pages#manual'
  get 'signup'             => 'users#new'
  get 'register_user'      => 'users#register_user'
  get 'login'              => 'sessions#new'
  post 'login'             => 'sessions#create'
  delete 'logout'          => 'sessions#destroy'
  get 'bank'               => 'bank_system#index'
  get 'transactions'       => 'bank_system#transactions'
  get 'properties'         => 'bank_system#properties'
  get 'stock_mkt'          => 'bank_system#stock_mkt'
  get 'new_contract'       => 'transactions#new_contract'
  get 'new_copyright'      => 'copyrights#new'
  get 'cbt'                => 'transactions#cbt'
  get 'company_bank'       => 'user_bank#index'
  get 'cbstock'            => 'user_bank#stock'
  get 'stock_purchase'     => 'user_transactions#stock_purchase'
  get 'stock_sale'         => 'user_transactions#stock_sale'
  patch 'activate'         => 'copyrights#activate'
  patch 'retire'           => 'copyrights#retire'
  post 'retire_all'        => 'copyrights#retire_all'
  get 'property_purchase'  => 'transactions#new_property_purchase'
  post 'tax_all'            => 'transactions#tax_all'
  get 'companies/index'
  get 'companies/show'
  resources :users
  resources :stocks
  resources :company_accounts
  resources :transactions
  resources :user_transactions
  resources :copyrights
  resources :properties

  #Reseters
  get 'bank_settings' => "bank_system#settings"
  delete 'reset_accounts' => "company_accounts#reset_accounts"
  delete 'reset_user_accounts' => "users#reset_accounts"
  delete 'reset_transactions'   => "transactions#reset_transactions"

  #Event Reset
  delete 'reset_event' => "application#reset_event"
end
