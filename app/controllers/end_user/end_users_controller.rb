class EndUser::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
  end

  def unsubscribe
  end

  def withdraw
  end
end
