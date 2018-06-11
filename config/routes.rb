Rails.application.routes.draw do
  resource :events, only: :create, defaults: { formats: :json }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :issues, only: :events do
    resources :events
  end
end
