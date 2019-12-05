Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update] do
    resources :favorites
  end
  resources :categories, only: [:index, :show] do
    resources :articles, only: [:index]
  end
  resources :articles, only: [:index, :show]

  resources :countries, only: [:index, :show] do
    resources :articles, only: [:index]
    resources :categories, only: [:index, :show] do
      resources :articles, only: [:index]
    end
  end
end
