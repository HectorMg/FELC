Rails.application.routes.draw do

  get 'copyrights/index'

  get 'copyrights/show'

  get 'copyrights/new'

  get 'copyrights/create'

  get 'copyrights/edit'

  get 'copyrights/destroy'

  get 'stocks/index'

  get 'stocks/show'

  get 'stocks/new'

  get 'stocks/create'

  get 'stocks/edit'

  get 'stocks/delete'

  root                    'landing_page#landing'
  get 'home'           => 'static_pages#home'
  get 'teams'          => 'static_pages#company'
  get 'schedule'       => 'static_pages#schedule'
  get 'manual'         => 'static_pages#manual'
  get 'signup'         => 'users#new'
  get 'login'          => 'sessions#new'
  post 'login'         => 'sessions#create'
  delete 'logout'      => 'sessions#destroy'
  get 'bank'           => 'bank_system#index'
  get 'transactions'   => 'bank_system#transactions'
  get 'properties'     => 'bank_system#properties'
  get 'stock_mkt'      => 'bank_system#stock_mkt'
  get 'new_contract'   => 'transactions#new_contract'
  get 'new_copyright'  => 'transactions#new_copyright'
  get 'cbt'            => 'transactions#cbt'
  get 'company_bank'   => 'user_bank#index'
  get 'cbstock'        => 'user_bank#stock'
  get 'stock_purchase' => 'user_transactions#stock_purchase'
  get 'stock_sale'     => 'user_transactions#stock_sale'
  get 'companies/index'
  get 'companies/show'
  resources :users
  resources :stocks
  resources :company_accounts
  resources :transactions
  resources :user_transactions
end
