Hub::Application.routes.draw do

  resources :old_items

  # get "old_items/index"

  get "home/index"
  post "home/contact_create"

  get "statistics/user"
  get "statistics/media"
  
  put "admin/ban_user"
  put "admin/update_preferences"

  # /users
  resources :users do
    resources :flags, only: [:index, :new, :create, :destroy]
    resources :messages, only: [:new, :create]
    
    member do
      put :check_confirm_code
      put :validate_pwd_change
    end   
  end

  # /admin
  resources :admin do
    collection do
      get 'flagged_events'
      get 'flagged_items'
      get 'flagged_projects'
      get 'flagged_users'
      get 'banned_users'
    end
  end

  # /events
  resources :events do
    resources :flags, only: [:index, :new, :create, :destroy]
  end

  # /items
  resources :items do
    collection do
      get 'myItems'
    end
    resources :flags, only: [:index, :new, :create, :destroy]
  end

  # /projects
  resources :projects do
    resources :flags, only: [:index, :new, :create, :destroy]
  end

  # /news
  resources :news
  # /password_resets
  resources :password_resets, only: [:new, :create, :edit, :update]
  # /search
  resources :search, only: [:index, :new]
  # /sessions
  resources :sessions, only: [:new, :create, :destroy]
  # /wish_lists
  resources :wish_lists

  # Custom Routes
  match '/search_results', to:'search#index' 
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/forgot_pass', to: 'users#password_forgot'
  match '/new_wish_list', to: 'wish_lists#new'
  match '/gallery', to: 'projects#index'
  match "/users/:id/confirm" => "users#confirm_user", as: "confirm_signup"
  match "/users/:id/change_password" => "users#change_password", as: "change_pwd"
  match "/users/:id/userItems" => "users#userItems", as: "user_items"
  match "flag/:id/delete" => "flags#destroy", :via => [:delete]
  match "/reason" => "statistics#reason_for_deletion"
  match "/deletion_results" => "statistics#deletion_results", :via => [:put]
  match "/items/?category='Appliances'" => "items#index"
  match "/items/?category='Architectural'" => "items#index"
  match "/items/?category='Cabinets'" => "items#index"
  match "/items/?category='Electrical'" => "items#index"
  match "/items/?category='Exterior Doors'" => "items#index"
  match "/items/?category='Flooring'" => "items#index"
  match "/items/?category='Furniture'" => "items#index"
  match "/items/?category='Hardware'" => "items#index"
  match "/items/?category='Heating & Cooling'" => "items#index"
  match "/items/?category='Interior Doors'" => "items#index"
  match "/items/?category='Lumber'" => "items#index"
  match "/items/?category='Masonry, Tile & Stone'" => "items#index"
  match "/items/?category='Plumbing'" => "items#index"
  match "/items/?category='Tools'" => "items#index"
  match "/items/?category='Windows'" => "items#index"
  match "/items/?category='Other'" => "items#index"

  match '/contact', to:'home#contact', :via => [:get]
  match '/contact', to:'home#contact_create', :via => [:post]

  
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
  root :to => 'home#index'
  match "*a", to:'home#not_found' 
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
