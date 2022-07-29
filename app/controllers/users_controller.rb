class UsersController < ApplicationController
  include SessionsHelper
  # 正しい管理者→index, unsubscribe, withdraw
  # 正しい管理者or正しいスタッフ→show

  before_action :login_admin_user_or_login_user
  before_action :set_admin_user
  before_action :set_user, only:[:show, :unsubscribe, :withdraw]
  before_action :correct_admin_user, only:[:index, :unsubscribe, :withdraw]
  before_action :correct_admin_user_or_correct_user, only:[:show]
  
  def index
    @users = @admin_user.users.where(is_valid:true)
  end

  def show
  end

  # 退会手続きページ（editページに働きは近い）
  def unsubscribe
  end
  
  # 退会アクション（updateアクションに働きは近い）
  def withdraw
    @user = User.find_by(id: params[:id])
    # is_validカラムを無効にして、退会扱い
    @user.update(is_valid: false)
    # reset_session ログアウトする。←今回は退会させるのは管理者なので処理後に管理者がログアウトしないように、コメントアウト
    redirect_to root_path
  end

  private
    def login_admin_user_or_login_user
      unless admin_user_signed_in? || user_signed_in?
        flash[:alert]="管理者か従業員でログインしてください"
        redirect_to root_url
      end
    end

    def set_admin_user
      @admin_user = AdminUser.find(params[:admin_user_id])
    end

    def set_user
      @user = User.find(params[:id])
    end

    def correct_admin_user
      redirect_to root_url unless current_admin_user?(@admin_user)
    end

    def correct_admin_user_or_correct_user
      if admin_user_signed_in?
        unless current_admin_user?(@admin_user)
          flash[:alert]="権限がありません"
          redirect_to root_url
        end
      elsif user_signed_in?
        unless @user.id == current_user.id
          flash[:alert]="権限がありません"
          redirect_to root_url
        end
      end
    end


end
