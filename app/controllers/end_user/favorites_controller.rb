class EndUser::FavoritesController < ApplicationController
  before_action :set_park, only: [:create, :destroy]

  def create
    favorite = current_end_user.favorites.new(park_id: @park.id)
    favorite.save
    # redirect_to request.referer
    render 'replace_btn'
  end

  def destroy
    favorite = current_end_user.favorites.find_by(park_id: @park.id)
    favorite.destroy
    # redirect_to request.referer
    render 'replace_btn'
  end

  private

  def set_park
    @park = Park.find(params[:park_id])
  end
end
