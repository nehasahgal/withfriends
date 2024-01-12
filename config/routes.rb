Rails.application.routes.draw do
  # Routes for the Friendrequest resource:

  # CREATE
  post("/insert_friendrequest", { :controller => "friendrequests", :action => "create" })
          
  # READ
  get("/friendrequests", { :controller => "friendrequests", :action => "index" })
  
  get("/friendrequests/:path_id", { :controller => "friendrequests", :action => "show" })
  
  # UPDATE
  
  post("/modify_friendrequest/:path_id", { :controller => "friendrequests", :action => "update" })
  
  # DELETE
  get("/delete_friendrequest/:path_id", { :controller => "friendrequests", :action => "destroy" })

  #------------------------------

  # Routes for the Traveler resource:
  root "trips#index"
  
  get("/:user_id", { :controller => "trips", :action => "my_trips"})
  # CREATE
  post("/insert_traveler", { :controller => "travelers", :action => "create" })
          
  # READ
  #get("/travelers", { :controller => "travelers", :action => "index" })
  
  get("/travelers/:path_id", { :controller => "travelers", :action => "show" })
  
  # UPDATE
  
  post("/modify_traveler/:path_id", { :controller => "travelers", :action => "update" })
  
  # DELETE
  get("/delete_traveler/:path_id", { :controller => "travelers", :action => "destroy" })

  #------------------------------

  # Routes for the Trip resource:

  # CREATE
  post("/insert_trip", { :controller => "trips", :action => "create" })
          
  # READ
  get("/trips", { :controller => "trips", :action => "index" })
  
  get("/trips/:path_id", { :controller => "trips", :action => "show" })
  
  # UPDATE
  
  post("/modify_trip/:path_id", { :controller => "trips", :action => "update" })
  
  # DELETE
  get("/delete_trip/:path_id", { :controller => "trips", :action => "destroy" })

  #------------------------------

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
