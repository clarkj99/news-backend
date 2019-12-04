Rails.application.routes.draw do
  resources :categories, only: [:index, :show] do
    resources :articles, only: [:index]
  end
  resources :articles, only: [:index, :show]

  resources :countries, only: [:index, :show] do
    resources :categories, only: [:index, :show] do
      resources :articles, only: [:index]
    end
  end
end
