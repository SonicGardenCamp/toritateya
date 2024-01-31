Rails.application.routes.draw do
  root to: 'top_page#top'
  devise_for :users
  resources :borrows, except: [:show]
  resources :lends, except: [:show]
end
