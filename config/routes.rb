Rails.application.routes.draw do
  devise_for :users
  root 'goals#index'
  resources :goals do
    member do
      patch :complete
      post :notify_friend
    end
    resources :shared_mails
  end
end
