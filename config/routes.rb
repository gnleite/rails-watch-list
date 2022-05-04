Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: %w[index show new create] do
    resources :bookmarks, only: %w[new create]
  end
  resources :bookmarks, only: %w[destroy]
end
