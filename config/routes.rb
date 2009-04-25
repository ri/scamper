ActionController::Routing::Routes.draw do |map|
  
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  
  map.resources :hunts, :has_many =>[:users], :member => {:add_player => :put}
  map.resources :users, :has_many =>[:hunts]
  map.resources :hunts, :has_many =>[:questions]
  map.resources :questions, :has_many =>[:hints]
  
  map.resource :session
  
  map.root :controller => "site", :view => "index"
end
