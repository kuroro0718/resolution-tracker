Rails.application.routes.draw do
  root 'goals#index'
  resources :goals do
    resources :shared_mails
  end
end
