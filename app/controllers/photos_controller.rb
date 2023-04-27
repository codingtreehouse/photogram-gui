class PhotosController < ApplicationController

  def index
    render({:template => "photo_templates/index.html.erb"})
  end

  def show
    url_id = params.fetch("path_username")
    matching_photo = Photo.where({:id => url_id})
    @the_photo = matching_photo.first
    render({:template => "photo_templates/show.html.erb"})
  end

end
