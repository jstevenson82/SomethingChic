Somethingchic::Application.routes.draw do

  resources :blogs, :comments, :users, :user_sessions, :homes, :galleries, :emailer, :request_information
  
  root :to => 'homes#index'
  
  match 'create_comment/:id' => 'blogs#create_comment', :as => :comment_create
  match 'comments/:id/new_comment' => 'comments#new_comment', :as => :comment
  match 'blogs/:id/show' => 'blogs#show', :as => :blog_view
  match 'blogs' => 'blogs#index', :as => :blog_home
  match 'gallery' => 'galleries#index', :as => :gallery_view
  #match 'emailer' => 'emailer#index', :as => :emailer 
  #match 'sendmail' => 'emailer#sendmail'
  
  match 'request_information' => 'request_information#index', :as => :request 
  match 'sendmail' => 'request_information#sendmail'

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
