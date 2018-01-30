Rails.application.routes.draw do
  get 'static_pages/utils'

  get 'static_pages/preparation'

  get 'static_pages/photos'

  get 'static_pages/foreigners'

  get 'static_pages/prices'

  get 'static_pages/gliders'

  get 'static_pages/training'

  get 'static_pages/baptism'

  get 'static_pages/learn'

  get 'static_pages/home'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :charges
end
