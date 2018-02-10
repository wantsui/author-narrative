Rails.application.routes.draw do
  devise_for :writers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :writers do
    resources :stories
  end
  root to: "writers#index"
end
