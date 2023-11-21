# frozen_string_literal: true

Rails.application.routes.draw do
  post '/process_array', to: 'number_arrays#process_array'
  root 'number_arrays#new'
end
