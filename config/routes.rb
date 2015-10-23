Rails.application.routes.draw do

  root               'landing_page#landing'
  get 'home'      => 'static_pages#home'
  get 'company'   => 'static_pages#company'
  get 'schedule'  => 'static_pages#schedule'
  get 'manual'    => 'static_pages#manual'
  get 'signup'    => 'users#new'

  resources :users

end
