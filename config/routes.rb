Rails.application.routes.draw do
  scope module: :web do
    resources :sessions, only: [:new, :create]
    delete :logout, to: 'sessions#destroy'

    namespace :user, path: 'cabinet' do
      resources :tasks, except: :index

      root to: 'tasks#index'
    end

    root to: 'welcome#index'
  end
end
