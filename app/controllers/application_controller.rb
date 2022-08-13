class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin then
      admin_end_users_path
    when EndUser then
      end_user_path(@end_user)
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin then
      new_admin_session_path
    when :end_user then
      root_path
    end
  end

  protected
  # サインアップ、サインイン時にnameを保存できるようにする
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
