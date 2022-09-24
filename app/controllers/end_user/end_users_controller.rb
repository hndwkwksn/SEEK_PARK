class EndUser::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_correct_end_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]
  before_action :admin_information, only: [:show, :edit, :favorites]

  def show
    @end_user = EndUser.find(params[:id])
    @parks = @end_user.parks.page(params[:page]).per(5)
  end

  def edit
  end

  def update
    if @end_user.update(end_user_params)
      redirect_to end_user_path(@end_user), notice: "プロフィールを更新しました。"
    else
      @admin_informations = AdminInformation.all
      render "edit"
    end
  end

  def favorites
    @end_user = EndUser.find(params[:id])
    favorites = Favorite.where(end_user_id: @end_user.id).pluck(:park_id)
    @favorite_parks = Park.find(favorites)
  end


  private

  def end_user_params
    params.require(:end_user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_end_user
    @end_user = EndUser.find(params[:id])
    unless @end_user == current_end_user
      redirect_to end_user_path(current_end_user)
    end
  end

  def ensure_guest_user
    @end_user = EndUser.find(params[:id])
    if @end_user.guest?
      redirect_to end_user_path(current_end_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  def admin_information
    @admin_informations = AdminInformation.all
  end
end
