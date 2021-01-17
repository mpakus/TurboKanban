# frozen_string_literal: true

Rails.application.routes.draw do
  # mount ActionCable.server => '/cable'

  devise_for :users
  resources :boards do
    resources :tasks, controller: 'boards/tasks'
  end

  root 'boards#index'
end
