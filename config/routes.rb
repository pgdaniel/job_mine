Rails.application.routes.draw do

  resources :jobs do
    resources :search_terms do
      resources :listings
    end
  end

  resources :listings
  resources :word_frequencies

  root to: 'jobs#index'
end
