class Post < ApplicationRecord
  validates :text, presence: true

    default_scope -> { order(created_at: :desc) } # 表示順
    
    belongs_to :user#
    belongs_to :book# 
    has_many :comments#
    has_many :comment_points, through: :comments, source: 'point'
    has_many :nices, dependent: :destroy
    has_many :nicing_users, through: :nices, source: :user
    has_many :post_hash_tags
    mount_uploader :image1, ImagesUploader
    mount_uploader :image2, ImagesUploader
    mount_uploader :image3, ImagesUploader


end
