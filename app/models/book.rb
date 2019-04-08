class Book < ApplicationRecord
  belongs_to :user#

  has_many :posts, dependent: :destroy#
  has_many :favorites#
  has_many :book_hash_tags#

  has_many :favorite_users,through: :favorites,source: "user"
  mount_uploader :bookCover, ImagesUploader

  enum progress: {"終了" => true,"継続中" => nil}


end
