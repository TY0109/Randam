class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :store_user_location!, if: :storable_location?
  before_action :configure_permitted_parameters, if: :devise_controller?

  include SessionsHelper

  
  # def logged_in_userは定義不要
  
  # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end
  
  protected

  def configure_permitted_parameters
    #新規登録時のストロングパラメータに「nameカラム」の追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :student])
    #更新時のストロングパラメータに「nameカラム」の追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :student])
  end
  
  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
  


end
