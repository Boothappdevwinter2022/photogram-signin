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
    p_id = params.fetch("input_photo_id")
    f_id = session.fetch(:user_id)
    like = Like.where({ :photo_id => pd_id, :fan_id => f_id }).at(0)

    like.destroy

    redirect_to("/photos/#{p_id}")
  end
end
