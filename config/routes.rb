ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  
  map.resources :hunts, :has_many => [:users, :questions], :member => {:add_player => :put, :play => :get}
  map.resources :users, :has_many => [:hunts]
  map.resources :questions, :has_many => [:hints, :answers], :member => {:printview => :get, :new_answer => :put,  :answer => :get}
  
  map.resource :session
  
  map.root :controller => "site", :view => "index"
end
