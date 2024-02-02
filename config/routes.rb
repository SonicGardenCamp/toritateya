Rails.application.routes.draw do
  root to: 'top_page#top'
  devise_for :users
  resources :borrows do
    resources :repayments, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :lends
end
