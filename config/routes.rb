Rails.application.routes.draw do

  # resources :superclusters

  resources :galaxies do
    resources :stars
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
