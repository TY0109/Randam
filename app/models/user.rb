class User < ApplicationRecord
  belongs_to :admin_user

  has_many :user_folders
  has_many :folders, through: :user_folders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password, presence: true, length: { minimum: 6}, allow_nil: true
  validates :password_confirmation, presence: true, length: { minimum: 6}, allow_nil: true

end
