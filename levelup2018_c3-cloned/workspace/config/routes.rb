Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    resources :users, only: [:index, :show, :create, :update, :destroy]
    resource :user_count, only: :show
  end
end
