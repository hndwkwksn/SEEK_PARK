class EndUser::FavoritesController < ApplicationController
  def create
    park = Park.find(params[:park_id])
    favorite = current_user.favorites.new(park_id: park.id)
    favorite.save
    redirect_to park_path(park)
  end

  def destroy
    park = Park.find(params[:park_id])
    favorite = current_user.favorites.find_by(park_id: park.id)
    favorite.destroy
    redirect_to park_path(park)
  end
end
