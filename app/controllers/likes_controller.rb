class LikesController < ApplicationController
  def create
    new_like = Like.new
    p_id = params.fetch("input_photo_id")
    new_like.fan_id = session.fetch(:user_id)
    new_like.photo_id = p_id
    new_like.save

    redirect_to("/photos/#{p_id}")
  end

  def destroy
    l_id = params.fetch("the_like_id")
    like = Like.where({ :id => l_id}).at(0)
    p_id = Photo.where({ :id => like.photo_id}).at(0).id

    like.destroy
    
    # redirect_to("/photos")
    redirect_to("/photos/#{p_id}")
  end
end
