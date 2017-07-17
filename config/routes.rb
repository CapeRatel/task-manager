Rails.application.routes.draw do
  scope module: :web do
    resources :sessions, only: [:new, :create]
    delete :logout, to: 'sessions#destroy'

    namespace :admin do
      resources :tasks, except: :index do
        patch :change_state, on: :member
      end

      root to: 'tasks#index'
    end

    namespace :user, path: 'cabinet' do
      resources :tasks, except: :index do
        patch :change_state, on: :member
      end

      root to: 'tasks#index'
    end

    root to: 'welcome#index'
  end
end
