# frozen_string_literal: true

class EndUser::SessionsController < Devise::SessionsController
  before_action :reject_inactive_end_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # 退会済みの会員が、同じアカウントでログイン出来ないようにするメソッド
  def reject_inactive_end_user
    # ログイン時に入力されたemailに対応するユーザーが存在するか探す。
    @end_user = EndUser.find_by(email: params[:end_user][:email])
    if @end_user
      # 入力されたパスワードが正しいことを確認。
      if @end_user.valid_password?(params[:end_user][:password]) && !@end_user.is_deleted
        flash[:danger] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
        redirect_to new_end_user_session_path
      end
    end
  end
end
