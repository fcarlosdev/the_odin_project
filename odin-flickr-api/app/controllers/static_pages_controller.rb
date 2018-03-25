class StaticPagesController < ApplicationController

  def home
    photos = flickr.photos.search(group_id: "34427469792@N01")
    puts photos
  end
end
