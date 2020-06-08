Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/analysis'

  devise_for :accounts, controllers: {registrations: 'accounts/registrations'}
  resources :departments
  resources :accounts
  resources :receipt_items
  resources :receipts
  resources :employees
  resources :shops
  resources :items
  resources :items

  root to: 'static_pages#home'
end
