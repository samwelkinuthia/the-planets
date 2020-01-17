Rails.application.routes.draw do
  root to: 'galaxies#index'
  
  resources :galaxies do
    resources :stars do
      resources :planets
    end
  end
  resources :superclusters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
