Eviral::Application.routes.draw do
  resources :members, :only => [:new, :create, :show]

  match 'members/:permalink' => 'members#new', :as => :viral_new
  root :to => "members#new"  
end
