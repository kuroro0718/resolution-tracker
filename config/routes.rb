Rails.application.routes.draw do
  devise_for :users
  root 'goals#index'
  resources :goals do
    member do
      patch :complete
    end
    resources :shared_mails
  end
end
