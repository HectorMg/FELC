Rails.application.routes.draw do
  root 'static_pages#home'

  get 'static_pages/company'

  get 'static_pages/schedule'

  get 'static_pages/manual'

end
