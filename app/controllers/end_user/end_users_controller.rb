class EndUser::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
  end

  def update
    if @end_user.update(end_user_params)
      redirect_to end_user_path(@end_user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :introduction, :profile_image)
  end
end
