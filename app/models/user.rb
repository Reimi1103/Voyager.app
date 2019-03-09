class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  before_save { self.email = email.downcase }

  has_many :posts#
  has_many :books#
  has_many :favorites#
  has_many :comments#
  has_many :relationships#
  has_many :nices#
  has_many :points#
  has_many :withdrawals#
  has_one :bank_accounts#

  mount_uploader :image, ImagesUploader
  mount_uploader :thaksImage, ImagesUploader
end
