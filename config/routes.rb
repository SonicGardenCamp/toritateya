Rails.application.routes.draw do
  root 'top_page#index'
  devise_for :users
  resources :borrows do
    resources :repayments, only: %i[new create edit update destroy]
  end
  resources :lends
  get "lends/approval/:id", to: "lends#approval", as: "lend_approval"
  get "repayments/approval/:id", to: "repayments#approval", as: "repayment_approval"
end
