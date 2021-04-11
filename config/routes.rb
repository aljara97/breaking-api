Rails.application.routes.draw do
  get 'welcome/index'
  get 'better', to: 'better#index'
  get 'better/:id', to: 'better#show', as: 'betterseason'
  get 'breaking', to: 'breaking#index'
  get 'breaking/:id', to: 'breaking#show', as: 'breakingseason'
  resources :quotes
  resources :episodes
  resources :characters
  get '', to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
