Rails.application.routes.draw do

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
  get 'new_contract'   => 'transactions#new_contract'
  get 'new_copyright' =>'transactions#new_copyright'
  get 'stock_purchase' => 'transactions#stock_purchase'
  get 'stock_sale'     => 'transactions#stock_sale'
  get 'deposit'        => 'transactions#deposit'
  get 'withdraw'       => 'transactions#withdraw'
  get 'companies/index'
  get 'companies/show'
  resources :users
  resources :company_accounts
  resources :transactions
end
