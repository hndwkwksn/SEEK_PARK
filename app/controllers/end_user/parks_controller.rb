class EndUser::ParksController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_correct_end_user, only: [:edit, :update, :destroy]

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    @park.end_user_id = current_end_user.id
    tag_list = params[:park][:tag_name].split(',')
    if @park.save
      @park.save_tags(tag_list)
      redirect_to park_path(@park), notice: "You have created park successfully."
    else
      render 'new'
    end
  end

  def show
    @park = Park.find(params[:id])
    @park_comment = ParkComment.new
    gon.park = @park
  end

  def index
    @q = Park.ransack(params[:q])
    @parks = @q.result(distinct: true).includes(:end_user).order(created_at: :desc).page(params[:page]).per(5)
  end

  def edit
  end

  def update
    if @park.update(park_params)
      redirect_to park_path(@park), notice: "You have updated park successfully."
    else
      render "edit"
    end
  end

  def destroy
    if @park.destroy
      flash[:notice] = "Park was successfully destroyed."
      redirect_to end_user_path(current_end_user)
    end
  end

  private

  def park_params
    params.require(:park).permit(:name, :introduction, :address, :image)
  end

  def ensure_correct_end_user
    @park = Park.find(params[:id])
    unless @park.end_user == current_end_user
      redirect_to end_user_path(current_end_user)
    end
  end
end
