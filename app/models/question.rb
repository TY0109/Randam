class Question < ApplicationRecord
  belongs_to :admin_user

  has_one_attached :image
end
