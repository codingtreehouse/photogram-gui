class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})
    render({:template => "photo_templates/index.html.erb"})
  end

  def show
    url_id = params.fetch("path_username")
    matching_photo = Photo.where({:id => url_id})
    @the_photo = matching_photo.first
    render({:template => "photo_templates/show.html.erb"})
  end

  def delete
    the_id = params.fetch("path_id")
    matching_photo = Photo.where({:id => the_id})
    the_photo = matching_photo.first
    the_photo.destroy
    #render({:template => "photo_templates/delete.html.erb"})
    redirect_to("/photos")
  end

  def insert
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")    
    input_owner = params.fetch("query_owner")

    new_photo = Photo.new

    new_photo.image = input_image
    new_photo.caption = input_caption
    new_photo.owner_id = input_owner

    new_photo.save

    #render({:template => "photo_templates/create.html.erb"})
    redirect_to("/photos/" + new_photo.id.to_s)
  end

  def update
    the_id = params.fetch("path_username")
    image_url = params.fetch("input_image")
    image_caption = params.fetch("input_caption")
    matching_photo = Photo.where({:id => the_id})
    the_photo = matching_photo.first

    the_photo.image = image_url
    the_photo.caption = image_caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def add_comment
    new_comment = Comment.new

    new_comment.photo_id = params.fetch("photo_id")
    new_comment.author_id = params.fetch("author_username")
    new_comment.body = params.fetch("comment_text")

    new_comment.save

    redirect_to("/photos/" + new_comment.photo_id.to_s)
  end
end
