Rails.application.routes.draw do
  scope module: :web do
    resources :sessions, only: [:new, :create]
    delete :logout, to: 'sessions#destroy'

    root to: 'welcome#index'
  end
end
