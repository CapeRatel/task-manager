Rails.application.routes.draw do
  scope module: :web do
    resources :sessions, only: [:new, :create, :destroy]

    root to: 'welcome#index'
  end
end
