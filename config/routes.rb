Rails.application.routes.draw do
  resources :codes, path: '/', only: [:index, :show, :new, :create] do
    collection do
      get :random
    end
  end

  root 'codes#index'
end
