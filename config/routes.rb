Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "index"})
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:path_username", {:controller => "users", :action => "show"})

  get("/photos",{:controller => "photos", :action => "index"})
  get("/photos/:path_username",{:controller => "photos", :action => "show"})

  get("/delete_photo/:path_id",{:controller => "photos", :action => "delete"})

  get("/insert_photo",{:controller => "photos", :action => "insert"})
  get("/update_photo/:path_username",{:controller => "photos", :action => "update"})

  get("/add_user",{:controller => "users", :action => "add_user"})
  get("/update_username/:input_username",{:controller => "users", :action => "edit_user"})

  get("/add_comment",{:controller => "photos",:action => "add_comment"})
end
