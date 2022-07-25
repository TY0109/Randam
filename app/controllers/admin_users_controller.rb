class AdminUsersController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_admin_user, only:[:show]

  def show
  end

  private
    def set_admin_user
      @admin_user = AdminUser.find(params[:id])
    end

end
