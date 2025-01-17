# frozen_string_literal: true

Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  # admin関連=========================================================
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # =================================================================

  # user関連==========================================================
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
    resources :cars do
      patch 'update_images'
    end
    resources :general_users
    resources :dash_boards, only: [:index]
    resources :articles, only: %i[index show]
    resources :news, only: %i[index show], param: :uuid
    resource :profile, except: %i[create new]
    resource :business, except: %i[index destroy] do
      patch 'update_images'
    end
    resources :workers do
      patch 'update_workerlicense_images'
      patch 'update_workerskilltraining_images'
      patch 'update_workerspecialeducation_images'
      patch 'update_workerexam_images'
    end
    resources :orders, param: :site_uu_id
    resources :request_orders, only: %i[index show], param: :uuid do
      resources :sub_request_orders, except: %i[edit destroy show], param: :uuid do
        resources :documents, only: %i[index show], param: :uuid, controller: 'sub_request_orders/documents'
      end
      resources :documents, only: %i[index show edit update], param: :uuid
    end
    post 'request_orders/:uuid/submit', to: 'request_orders#submit', as: :request_order_submit
  end
  # =================================================================

  # manager関連=======================================================
  # devise_for :managers, controllers: {
  #   sessions:      'managers/sessions',
  #   passwords:     'managers/passwords',
  #   confirmations: 'users/confirmations',
  #   registrations: 'managers/registrations'
  # }

  # =================================================================

  # system==============================================================
  # 利用規約
  get 'use' => 'system#use'
  # 特商法
  get 'law' => 'system#law'
  # プライバシーポリシー
  get 'privacy_policy' => 'system#privacy_policy'
  # =================================================================
end
