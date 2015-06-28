Rails.application.routes.draw do
  root 'entries#index'
  resources :posts

  get 'build_site' => 'entries#build_site'
  
  get 'entries' => 'entries#index'
  get 'new_entry' => 'entries#new'
  get 'new_dir_entry' => 'entries#new_dir'
  get 'edit_entry' => 'entries#edit'
  get 'uploader_entry' => 'entries#uploader'
  get 'renaming_entry' => 'entries#renaming'
  post 'create_entry' => 'entries#create'
  post 'create_dir_entry' => 'entries#create_dir'
  post 'update_entry' => 'entries#update'
  post 'destroy_entry' => 'entries#destroy'
  post 'upload_entry' => 'entries#upload'
  post 'rename_entry' => 'entries#rename'

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
