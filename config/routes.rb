ActionController::Routing::Routes.draw do |map|
  
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'

  map.resources :users
  map.resource :session
  map.resources :hunts
  map.resources :questions
  
  map.root :controller => "site", :view => "index"
end
