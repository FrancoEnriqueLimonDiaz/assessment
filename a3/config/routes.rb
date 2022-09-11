# frozen_string_literal: true
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :invoices

    end
  end
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  # See a list of all the invoices I have received from a provider(emitter)
  get '/api/v1/invoices/my_invoices', to: 'api/v1/invoices#my_invoices'
end
