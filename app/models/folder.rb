class Folder < ApplicationRecord
  belongs_to :admin_user
  
  has_many :user_folders
  has_many :users, through: :user_folders
end
