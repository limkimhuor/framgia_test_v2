Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users
  root "exams#index"
  resources :exams, only: [:index, :create]
  resources :users do
    resources :questions do
      collection { post :import_quesiton }
    end
  end
  resources :exams, only: [:index, :show, :create, :update]
end
