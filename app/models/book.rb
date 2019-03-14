class Book < ApplicationRecord
  belongs_to :user#

  has_many :posts, dependent: :destroy#
  has_many :favorites#
  has_many :book_hash_tags#
  mount_uploader :bookCover, ImagesUploader

end
