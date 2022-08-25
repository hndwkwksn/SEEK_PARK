class EndUser::ParksController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_correct_end_user, only: [:edit, :update, :destroy]
  before_action :end_user_form, only: [:index, :show, :edit, :new]
  before_action :admin_information, only: [:index, :show, :edit, :new]

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    @park.end_user_id = current_end_user.id
    tag_list = params[:park][:tag_name].split(',')
    if @park.save
      @park.save_tags(tag_list)
      redirect_to park_path(@park), notice: "投稿しました。"
    else
      @admin_informations = AdminInformation.all
      render 'new'
    end
  end

  def show
    @park = Park.find(params[:id])
    @park_comment = ParkComment.new
    gon.park = @park
  end

  def index
    @parks = @q.result(distinct: true).includes(:end_user).order(created_at: :desc).page(params[:page]).per(5)
  end

  def edit
  end

  def update
    if @park.update(park_params)
      tag_list = tag_params[:tag_name].split(',')
      @park.save_tags(tag_list)
      redirect_to park_path(@park), notice: "更新に成功しました。"
    else
      @admin_informations = AdminInformation.all
      render "edit"
    end
  end

  def destroy
    if @park.destroy
      flash[:notice] = "投稿を削除しました。"
      redirect_to end_user_path(current_end_user)
    end
  end

  private

  def park_params
    update_params.except(:tag_name) #exceptでtag_nameだけ除外(Unpermitted parameter: :tag_name対策)
  end

  def tag_params
   update_params.slice(:tag_name) #sliceでtag_nameだけ許可(Unpermitted parameters: :name, :introduction, :address対策)
  end

  def update_params
    params.require(:park).permit(:name, :introduction, :address, :image, :tag_name)
  end

  def ensure_correct_end_user
    @park = Park.find(params[:id])
    unless @park.end_user == current_end_user
      redirect_to end_user_path(current_end_user)
    end
  end

  def end_user_form
    @end_user = current_end_user
  end

  def admin_information
    @admin_informations = AdminInformation.all
  end
end
