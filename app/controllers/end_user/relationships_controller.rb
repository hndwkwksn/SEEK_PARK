class EndUser::RelationshipsController < ApplicationController
  before_action :authenticate_end_user!
  before_action :set_end_user

  # フォローするとき
  def create
    current_end_user.follow(@end_user)
    redirect_to request.referer
  end

  # フォロー外すとき
  def destroy
    current_end_user.unfollow(@end_user)
    redirect_to request.referer
  end

  # フォロー一覧
  def followings
    @end_users = @end_user.followings
  end

  # フォロワー一覧
  def followers
    @end_users = @end_user.followers
  end

private

  def set_end_user
    @end_user = EndUser.find(params[:end_user_id])
  end
end
