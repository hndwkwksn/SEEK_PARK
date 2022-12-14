class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def withdraw
    @end_user = EndUser.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @end_user.update(is_deleted: true)
    redirect_to admin_end_users_path
  end
end
