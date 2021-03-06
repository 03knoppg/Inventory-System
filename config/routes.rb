TestDBRubymineProject::Application.routes.draw do

  resources :table_aliases

  resources :validations

  resources :data_files

  post "images/new" => "images#create", :method => :get
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  post "login" => "sessions#new", :as => "login" #for testing php
  get "signup" => "users#new", :as => "signup"


  get "sessions/forgotpass"
  get "sessions/Minto"
  get "sessions/MintoCheck"
  get "sessions/update_minto"
  get "sessions/update_minto_price"
  get "sessions/update_minto_premium"

  resources :images
  resources :users
  resources :sessions
  root :to => 'sessions#new'
  resources :groups
  resources :properties
  resources :valuefields
  resources :ValuesController

  get "components/update_picture"

  resources :components
  resources :products
  resources :categories
  resources :password_resets

  get "admin/home"
  get "admin/addvalue"
  get "admin/updatecategory"
  post "admin/addvalue"
  get "admin/writefile"
  post "admin/writefile"
  get "admin/search"
  get "admin/do_search"

#Begin - For Tabs Page
  #Edit Product
    get "admin/load_edit_product_page"
  #Component Tabs Page
    get "admin/load_component_tab"
    get "admin/component_tab_root"
  #New Components
    get "admin/load_new_component_page"
  #Edit Components
    get "admin/load_edit_component_page"
  #Add Components
    get "admin/load_add_component_page"
    post "admin/add_components"
    put "admin/add_components"
  #New Valuefields
    get "admin/load_new_vf_page"
  #Edit Valuefields
    get "admin/load_edit_vf_page"
  #Add Valuefields
    get "admin/load_add_vf_page"
    post "admin/add_vfs"
    put "admin/add_vfs"
  #New Images
    get "admin/load_new_image_page"
  #Edit Images
    get "admin/load_edit_image_page"
  #Add Images
    get "admin/load_add_image_page"
    post "admin/add_images"
    put "admin/add_images"
  #New Data File
    get "admin/load_new_df_page"
  #Edit Data File
    get "admin/load_edit_df_page"
  #Add Data File
    get "admin/load_add_df_page"
    post "admin/add_dfs"
    put "admin/add_dfs"
  #Edit Data File
    get "admin/load_edit_datafile_page"
#End - For Tabs Page


  #test scale
  get "admin/testscale"

  #Posts used for duplicating records.
  post "categories/new"
  post "components/new"
  post "products/new"
  post "valuefields/new"

  match 'admin', :to => 'admin#home'
  match 'admin2', :to => 'admin#home_dock'
  match 'admin_addvalue', :to => 'admin#addvalue'

  match 'tabs/:type/:id', :to => 'admin#tabs'
  match 'tabs/products/edit/:id', :to => 'products#_edit'
  match 'tabs/components/edit/:id', :to => 'components#_edit'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  # match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  # resources :products

  # Sample resource route with options:
  # resources :products do
  # member do
  # get 'short'
  # post 'toggle'
  # end
  #
  # collection do
  # get 'sold'
  # end
  # end

  # Sample resource route with sub-resources:
  # resources :products do
  # resources :comments, :sales
  # resource :seller
  # end

  # Sample resource route with more complex sub-resources
  # resources :products do
  # resources :comments
  # resources :sales do
  # get 'recent', :on => :collection
  # end
  # end

  # Sample resource route within a namespace:
  # namespace :admin do
  # # Directs /admin/products/* to Admin::ProductsController
  # # (app/controllers/admin/products_controller.rb)
  # resources :products
  # end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id(.:format)))'
end