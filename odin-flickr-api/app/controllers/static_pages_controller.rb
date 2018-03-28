class StaticPagesController < ApplicationController

  def home
    if param_provided?(:flickr_id)
      id = params[:flickr_id]
      @user_id = id
    elsif params[:flickr_name]
      id = find_user(params[:flickr_name])['id']
      @user_name = params[:flickr_name]
    end
    @photos = search_photos(id) if id
  end

  private

  def search_photos(user_id,photos_total=20)
    begin
      flickr.photos.search(user_id: user_id, per_page: photos_total)
    rescue StandardError => e
      render partial: '/flickr/unavailable'
    end
  end

  def param_provided?(param_name)
    params[param_name] && !params[param_name].empty?
  end

  def find_user(user_name)
    begin
      flickr.people.findByUsername(username: user_name)
    rescue StandardError => e
      render partial: '/flickr/unavailable'
    end
  end

end
