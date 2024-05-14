
Rails.application.routes.draw do
  root "fruits#index"
  resources :fruits, only: [:index, :show]

  get 'fruits/:id', to: 'fruits#show', as: :fruit_info
  get 'all_data', to: 'fruits#all_data'
end
