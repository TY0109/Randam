class UsersController < ApplicationController
  # 定義は不要だが、showが自作なので、before_actionには記載必要
  before_action :authenticate_user!, only:[:show, :unsubscribe]
  # 定義必要
  before_action :set_user, only:[:show]
  # 管理者ユーザーがログインしていないと、一般ユーザー一覧画面は見られない
  before_action :authenticate_admin_user!, only:[:index]
  

  def index
    @users = User.all
  end

  def show
    @questions = Question.all
  end

  # 退会手続きページ（editページに働きは近い）
  def unsubscribe
  end
  
  # 退会アクション（updateアクションに働きは近い）
  def withdraw
    @user = User.find_by(id: params[:id])
    # is_validカラムを無効にして、退会扱い
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
