class UsersController < ApplicationController

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})
    render({:template => "user_templates/index.html.erb"})
  end

  def show
    url_username = params.fetch("path_username") 
    matching_usernames = User.where({:username=> url_username})
    
    @the_user = matching_usernames.first

    if @the_user == nil
      redirect_to("/404")
    else
      render({:template => "user_templates/show.html.erb"})
    end
  end

  def add_user 
    input_username = params.fetch("username_add")

    new_user = User.new

    new_user.username = input_username

    new_user.save

    #render({:template => "photo_templates/create.html.erb"})
    redirect_to("/users/" + new_user.username)
  end

  def edit_user
    the_id = params.fetch("input_username")
    matching_user = User.where({:id => the_id})
    the_user = matching_user.first

    the_user.username = params.fetch("username_edit")

    the_user.save

    redirect_to("/users/" + the_user.username)
  end
end
