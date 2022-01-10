# frozen_string_literal: true

Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  # admin
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # devise_for :admins, controllers: {
  #   sessions: 'admins/sessions'
  # }

  # users
  devise_scope :user do
    root 'users/sessions#new'
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    confirmations: 'users/confirmations',
    registrations: 'users/registrations'
  }

  namespace :users do
    resources :dash_boards, only: [:index]
    resources :articles, only: %i[index show]
    resource :profile, except: %i[create new]
  end

  # managers
  # devise_for :managers, controllers: {
  #   sessions:      'managers/sessions',
  #   passwords:     'managers/passwords',
  #   confirmations: 'users/confirmations',
  #   registrations: 'managers/registrations'
  # }

  # 利用規約
  get 'use' => 'use#index'
end
