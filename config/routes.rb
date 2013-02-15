# This is the routes file for our project
BestBay::Application.routes.draw do
  get "watchlists/create"

  get "shopping_carts/destroy"
  get "shopping_carts/create"
  match "shopping_carts/paypal_url", to: 'shopping_carts#paypal_url'
  match "shopping_carts/confirm", to: 'shopping_carts#confirm'
  get "watchlists/destroy"
  match '/users/profile', to: 'users#profile'

  match '/users/profile_info', to: 'users#profile_info'
  match '/users/update_profile_info', to: 'users#update_profile_info'

  devise_for :users
  resources :users do

    match '/users/save_seller_type', to: 'users#save_seller_type'

    member do
      get :followed_items
      get :items

    end
  end


  resources :watchlists
  resources :biddings
  resources :shopping_carts

  match '/check_out', to: 'check_out#check_out_form'

  match '/items/get_user_id', to: 'items#get_user_id'
  match '/items/edit', to: 'items#edit'
  match '/items/user_watchlist', to: 'items#user_watchlist'
  match '/items/user_shoppingcart', to: 'items#user_shoppingcart'
  match '/items/get_item_bidding', to: 'items#get_item_bidding'
  match '/items/search_result', to: 'items#search_result'
  match '/items/modify_picture', to: 'items#modify_picture'
  match '/items/upload_pics', to: 'items#upload_pics'
  match '/items/basic_information', to: 'items#basic_information'
  match '/items/set_price', to: 'items#set_price'
  match '/items/new', to: 'items#basic_information'
  match '/items/save_picture', to: 'items#save_picture'
  match '/items/save_basic', to: 'items#save_basic'

  get "/items/warning"

  get "categories/basic_information"

  get "categories/create"

  get "categories/show"

  get "categories/destroy"

  get "categories/index"

  get "categories/edit"

  resources :items
  root :to => 'static_pages#home'
  resources :items do
    member { post :vote }
  end
  get "static_pages/home"

  get "static_pages/contact"

  get "static_pages/career"

  get "static_pages/about"


  match "/users/save_seller_type", to: 'users#save_seller_type'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.

end
