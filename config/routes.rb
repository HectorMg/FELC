Rails.application.routes.draw do

  get 'companies/index'

  get 'companies/show'

  root                  'landing_page#landing'
  get 'home'         => 'static_pages#home'
  get 'teams'      => 'static_pages#company'
  get 'schedule'     => 'static_pages#schedule'
  get 'manual'       => 'static_pages#manual'
  get 'signup'       => 'users#new'
  get 'login'        => 'sessions#new'
  post 'login'       => 'sessions#create'
  delete 'logout'    => 'sessions#destroy'
  get 'bank'         => 'bank_system#index'
  get 'transactions' => 'bank_system#transactions'
  get 'properties'   => 'bank_system#properties'
  resources :users
  resources :companies
end
