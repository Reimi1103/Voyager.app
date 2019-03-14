class Post < ApplicationRecord
  belongs_to :user#
  belongs_to :book#

  has_many :comments#
  has_many :post_hash_tags#
  # has_many :points
  has_many :nices#

  mount_uploader :image1, ImagesUploader
  mount_uploader :image2, ImagesUploader
  mount_uploader :image3, ImagesUploader

  default_scope -> { order(created_at: :desc) }
  validates :text, presence: true, length: { maximum: 200 }
end
