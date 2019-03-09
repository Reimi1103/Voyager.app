class Book < ApplicationRecord
  belongs_to :user#
  belongs_to :pageview
  belongs_to :nice

  has_many :posts#
  has_many :favorites#
  has_many :book_hash_tags#
  mount_uploader :bookCover, ImagesUploader

end
