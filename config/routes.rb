TowerIntern::Application.routes.draw do
  root to: 'users#new'
  resources :users, path_names: { new: 'sign_up' }
  get 'homepage', to: 'home#index', as: :homepage
end
