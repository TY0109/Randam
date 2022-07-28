class StaticPagesController < ApplicationController
  def top
    @admin_user = AdminUser.find(1)
    @folders = @admin_user.folders
  end

end
