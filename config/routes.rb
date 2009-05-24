ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new_player'

  map.resource :session
  map.resources :users, :collection => {:new_creator => :get, :new_player => :get}, :has_many => [:hunts]
  
  map.resources :hunts, :member => {:invite_players => :get, :add_players => :put, :play => :get} do |hunts|
    hunts.resources :users
    hunts.resources :questions, :member => {:printview => :get, :new_answer => :put} do |questions|
      questions.resources :hints
      questions.resources :answers
      questions.resource  :response, :only => [:show, :create]
    end
  end
  
  map.root :controller => "site", :view => "index"
end
