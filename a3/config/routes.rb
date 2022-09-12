# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts
      resources :invoices
      get '/cfdi_digital_stamp/:id', to: 'posts#render_xml'
    end
  end
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  # See a list of all the invoices I have received from a provider(emitter)
  # get '/api/v1/invoices/my_invoices', to: 'api/v1/invoices#my_invoices'
end
