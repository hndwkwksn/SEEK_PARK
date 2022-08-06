class EndUser::ParksController < ApplicationController
  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    @park.end_user_id = current_end_user.id
    if @park.save
      redirect_to park_path(@park), notice: "You have created park successfully."
    else
      @parks = Park.all
      render 'index'
    end
  end

  def show
    @park = Park.find(params[:id])
  end

  def index
    @parks = Park.all
  end

  def edit
  end

  private

  def park_params
    params.require(:park).permit(:name, :introduction, :address, :image)
  end
end
