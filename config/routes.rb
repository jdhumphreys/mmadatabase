Rails.application.routes.draw do
  # Routes for the Fight resource:
  # CREATE
  get "/fights/new", :controller => "fights", :action => "new"
  post "/create_fight", :controller => "fights", :action => "create"

  # READ
  get "/fights", :controller => "fights", :action => "index"
  get "/fights/:id", :controller => "fights", :action => "show"

  # UPDATE
  get "/fights/:id/edit", :controller => "fights", :action => "edit"
  post "/update_fight/:id", :controller => "fights", :action => "update"

  # DELETE
  get "/delete_fight/:id", :controller => "fights", :action => "destroy"
  #------------------------------

  # Routes for the Venue resource:
  # CREATE
  get "/venues/new", :controller => "venues", :action => "new"
  post "/create_venue", :controller => "venues", :action => "create"

  # READ
  get "/venues", :controller => "venues", :action => "index"
  get "/venues/:id", :controller => "venues", :action => "show"

  # UPDATE
  get "/venues/:id/edit", :controller => "venues", :action => "edit"
  post "/update_venue/:id", :controller => "venues", :action => "update"

  # DELETE
  get "/delete_venue/:id", :controller => "venues", :action => "destroy"
  #------------------------------

  # Routes for the Fighter resource:
  # CREATE
  get "/fighters/new", :controller => "fighters", :action => "new"
  post "/create_fighter", :controller => "fighters", :action => "create"

  # READ
  get "/fighters", :controller => "fighters", :action => "index"
  get "/fighters/:id", :controller => "fighters", :action => "show"

  # UPDATE
  get "/fighters/:id/edit", :controller => "fighters", :action => "edit"
  post "/update_fighter/:id", :controller => "fighters", :action => "update"

  # DELETE
  get "/delete_fighter/:id", :controller => "fighters", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
