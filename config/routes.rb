Rails.application.routes.draw do

  resources :jobs do
    resources :search_terms
  end

  root to: 'jobs#index'
end
