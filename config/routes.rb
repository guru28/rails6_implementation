Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'newsletters/:id/send_newsletter', to: 'newsletters#send_newsletter', as: :newsletters_send_email

  resources :newsletters

  resources :subcribers

  root "newsletters#index"
end
