class UsersController < ApplicationController
  # 定義は不要だが、showが自作なので、before_actionには記載必要
  before_action :authenticate_user!, only:[:show]
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

  private
    def set_user
      @user = User.find(params[:id])
    end
end
