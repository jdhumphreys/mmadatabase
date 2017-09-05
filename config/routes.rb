Rails.application.routes.draw do
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
