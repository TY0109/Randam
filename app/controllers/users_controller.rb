class UsersController < ApplicationController
  before_action :authenticate_user! ,only:[:index,:show, :destroy]
  before_action :set_user, only:[:show, :edit]
  before_action :admin_user ,only: [:index, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
