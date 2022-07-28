class Question < ApplicationRecord
  belongs_to :admin_user

  has_one_attached :image

  def user
    if self.user_id.present?
      User.find(self.user_id)
    end
  end

  def was_attached?
    self.image.attached?
   end
   

end
