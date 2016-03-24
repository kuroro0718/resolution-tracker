Rails.application.routes.draw do
  devise_for :users
  root 'goals#index'
  resources :goals do
    resources :shared_mails
  end
end
