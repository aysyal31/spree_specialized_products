Spree::Core::Engine.routes.draw do
  # Add your extension routes here



  namespace :admin do
    resources :specialized_sku_stores
    resources :sku_stores_auths
    resources :import_sku_stores_auths

  end

  resources :specialized_sku_stores
  resources :user_specialized_sku_stores



end
