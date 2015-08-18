Rails.application.routes.draw do


  get 'users/all_edit' => 'users#edit_all', :as => :users_edit_all, :via => :get
  put 'users/all' => 'users#update_all', :as => :users_update_all, :via => :put

  resources :users

  # post 'comment/create'

  resources :comments

  # update rfx's invited vendors
  post 'rfx_vendor/create_update'

  # update rfx's sourcing type
  post 'rfx_sourcing_type/create_update'

  get 'start_point/index'
  get 'start_point/contact'
  root 'start_point#index'

  resources :vendors
  # match "/rfxes/:rfx_id/rfx_items", :to => "rfx_items#index_nested", via: :get, as: :items_by_rfx

  get 'rfxes/:id/select_sourcing_type' => 'rfxes#select_sourcing_type', as: :select_sourcing_type

  get 'rfx_rounds/all_edit' => 'rfx_rounds#edit_all'
  put 'rfx_rounds/all' => 'rfx_rounds#update_all'

  resources :rfxes do
    resources :rfx_items
    resources :rfx_rounds

    member do

    end
  end

  resources :materials
  resources :plants
  resources :sourcing_orgs
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
