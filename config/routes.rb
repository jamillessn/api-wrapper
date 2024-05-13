Rails.application.routes.draw do
  root "fruits#index"
  resources :fruits

  get 'fruits/:name', to: 'fruit#show', as: :fruit_info

end
