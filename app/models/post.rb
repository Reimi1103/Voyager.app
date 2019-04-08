class Post < ApplicationRecord
  belongs_to :user#
  belongs_to :book#

  has_many :comments#
  has_many :nices, dependent: :destroy
  has_many :nicing_users, through: :nices, source: :user

  mount_uploader :image1, ImagesUploader
  mount_uploader :image2, ImagesUploader
  mount_uploader :image3, ImagesUploader

  has_many :post_hash_tags
  after_create do
    post = Post.find_by(id: self.id)
    hashtags  = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end

  before_update do 
    post = Post.find_by(id: self.id)
    post.hashtags.clear
    hashtags = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end


  default_scope -> { order(created_at: :desc) }
  validates :text, presence: true, length: { maximum: 200 }
end
