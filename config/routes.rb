Rails.application.routes.draw do
  devise_for :users
  root "tier_lists#index"
  resources :tier_lists do
    resources :tier_list_items, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
