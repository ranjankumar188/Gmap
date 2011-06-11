ActionController::Routing::Routes.draw do |map|
  map.resources :users,:passwords
  map.resources :services
  map.resources :events
  map.resources :churches, :collection => {:search => :get}
  map.resources :sessions #, :collection => { :delete => :get }
  map.resources :searches, :collection =>{:list => :get}
#
  #map.root :controller => :churches
  map.resources :churches do |church|
    church.resources :services
    church.resources :events
  end
  # map.root :controller => 'churches'
#  map.resources :churches, :has_many => :services

  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
 # map.root :controller =>"sessions", :action=>"new"
  
  map.root :controller =>"searches",:action=>"index"
  map.connect 'login',:controller=>'sessions',:action=>'new'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
