Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'

  #ingredients
  resources :ingredients, only: %i(new create index destroy edit update) do
  end

  # dishes
  resource  :dishes, only: %i(new create index destroy edit update) do
end
