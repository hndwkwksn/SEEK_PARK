class Admin::AdminInformationsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @admin_information = AdminInformation.new
    @admin_informations = AdminInformation.all
  end

  def create
    @admin_information = AdminInformation.new(admin_information_params)
    if @admin_information.save
      redirect_to admin_admin_informations_path
    else
      @admin_informations = AdminInformation.all
      render 'index'
    end
  end

  def destroy
    @admin_information = AdminInformation.find(params[:id])
    if @admin_information.destroy
      flash[:notice] = "お知らせを削除しました。"
      redirect_to admin_admin_informations_path
    end
  end

  private

  def admin_information_params
    params.require(:admin_information).permit(:information)
  end
end
