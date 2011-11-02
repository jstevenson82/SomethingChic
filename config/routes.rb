Somethingchic::Application.routes.draw do

  resources :blogs, :comments, :users, :user_sessions, :homes, :galleries, :request_information, :users, :user_sessions, :gallery_sections, :services, :events
  
  root :to => 'homes#index'
  
  match 'create_comment/:id' => 'blogs#create_comment', :as => :comment_create
  match 'comments/:id/new_comment' => 'comments#new_comment', :as => :comment
  match 'blogs/:id/show-:title.html' => 'blogs#show', :as => :blog_view
  match 'blogs' => 'blogs#index', :as => :blog_home
  match 'events/:id/show-:title.html' => 'events#show', :as => :event_view
  match 'events' => 'events#index', :as => :event_home
  #match 'services/:id/show-:title.html' => 'services#show', :as => :service_view
  match 'services' => 'services#index', :as => :service_home
  match 'blog_categories/:id/:title-index.html' => 'blog_categories#show', :as => :blogs_by_name
  match 'galleries/:id/:title-index.html' => 'galleries#index', :as => :gallery_view
  match 'gallery_sections' => 'gallery_sections#index', :as => :gallery_section_index
  match 'galleries/:id/:title-view.html' => 'galleries#show', :as => :picture_view
  match 'create_gallery_comment/:id' => 'galleries#create_comment', :as => :picture_comment
  match 'home' => 'homes#index', :as => :home
  match 'comment_create_events' => 'events#create_comment', :as => :comment_create_events
    
  match 'request_information' => 'request_information#index', :as => :request 
  match 'sendmail' => 'request_information#sendmail'

  # *********   Manager Section   *********
  match '/manager/index_home' => 'manager#index_home', :as => :manager_index_home
  match '/manager/:id/update_home' => 'manager#update_home', :as => :manager_update_home
  match '/manager/create_home' => 'manager#create_home', :as => :manager_create_home
  match '/manager/:id/edit_home' => 'manager#edit_home', :as => :manager_edit_home
  match '/manager/new_home' => 'manager#new_home', :as => :manager_new_home
  match '/manager/:id/destroy_home' => 'manager#destroy_home', :as => :manager_destroy_home

  match '/manager/index_blog' => 'manager#index_blog', :as => :manager_index_blog
  match '/manager/:id/update_blog' => 'manager#update_blog', :as => :manager_update_blog
  match '/manager/create_blog' => 'manager#create_blog', :as => :manager_create_blog
  match '/manager/:id/edit_blog' => 'manager#edit_blog', :as => :manager_edit_blog
  match '/manager/new_blog' => 'manager#new_blog', :as => :manager_new_blog
  match '/manager/:id/destroy_blog' => 'manager#destroy_blog', :as => :manager_destroy_blog
  
  match '/manager/index_gallery' => 'manager#index_gallery', :as => :manager_index_gallery
  match '/manager/:id/update_gallery' => 'manager#update_gallery', :as => :manager_update_gallery
  match '/manager/create_gallery' => 'manager#create_gallery', :as => :manager_create_gallery
  match '/manager/:id/edit_gallery' => 'manager#edit_gallery', :as => :manager_edit_gallery
  match '/manager/new_gallery' => 'manager#new_gallery', :as => :manager_new_gallery
  match '/manager/:id/destroy_gallery' => 'manager#destroy_gallery', :as => :manager_destroy_gallery
  
  match '/manager/index_gallery_sections' => 'manager#index_gallery_sections', :as => :manager_index_gallery_sections
  match '/manager/:id/update_gallery_sections' => 'manager#update_gallery_sections', :as => :manager_update_gallery_sections
  match '/manager/create_gallery_sections' => 'manager#create_gallery_sections', :as => :manager_create_gallery_sections
  match '/manager/:id/edit_gallery_sections' => 'manager#edit_gallery_sections', :as => :manager_edit_gallery_sections
  match '/manager/new_gallery_sections' => 'manager#new_gallery_sections', :as => :manager_new_gallery_sections
  match '/manager/:id/destroy_gallery_sections' => 'manager#destroy_gallery_sections', :as => :manager_destroy_gallery_sections
  
  match '/manager/index_blog_categories' => 'manager#index_blog_categories', :as => :manager_index_blog_categories
  match '/manager/:id/update_blog_categories' => 'manager#update_blog_categories', :as => :manager_update_blog_categories
  match '/manager/create_blog_categories' => 'manager#create_blog_categories', :as => :manager_create_blog_categories
  match '/manager/:id/edit_blog_categories' => 'manager#edit_blog_categories', :as => :manager_edit_blog_categories
  match '/manager/new_blog_categories' => 'manager#new_blog_categories', :as => :manager_new_blog_categories
  match '/manager/:id/destroy_blog_categories' => 'manager#destroy_blog_categories', :as => :manager_destroy_blog_categories
  
  match '/manager/index_events' => 'manager#index_events', :as => :manager_index_events
  match '/manager/:id/update_events' => 'manager#update_events', :as => :manager_update_events
  match '/manager/create_events' => 'manager#create_events', :as => :manager_create_events
  match '/manager/:id/edit_events' => 'manager#edit_events', :as => :manager_edit_events
  match '/manager/new_events' => 'manager#new_events', :as => :manager_new_events
  match '/manager/:id/destroy_events' => 'manager#destroy_events', :as => :manager_destroy_events
  
  match '/manager/index_services' => 'manager#index_services', :as => :manager_index_services
  match '/manager/:id/update_services' => 'manager#update_services', :as => :manager_update_services
  match '/manager/create_services' => 'manager#create_services', :as => :manager_create_services
  match '/manager/:id/edit_services' => 'manager#edit_services', :as => :manager_edit_services
  match '/manager/new_services' => 'manager#new_services', :as => :manager_new_services
  match '/manager/:id/destroy_services' => 'manager#destroy_services', :as => :manager_destroy_services
  
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'register' => 'users#new', :as => :register
  
  # *********   Comment Remove   *********
  match 'comments/:id/remove_comment_blog/:blog_id' => 'comments#remove_comment_blog', :as => :remove_comment_blog
  match 'comments/:id/remove_comment_gallery/:blog_id' => 'comments#remove_comment_gallery', :as => :remove_comment_gallery
  
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
