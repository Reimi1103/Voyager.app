class Book < ApplicationRecord
#表示メッセージはcongig/ja.ymlで設定
#viewではeachを使って表示しないと、ハッシュ出力の[""]がついてしまうので注意

  validates :title,
  presence: {
    message: -> (rec, data) do
      I18n.t('no_title')
    end}

  validates :prologue,
    presence: {
    message: -> (rec, data) do
      I18n.t('no_prologue')
    end}

    validates :prologue,
    length: {
    minimum: 10,maximum: 180,
    message: -> (rec, data) do
      I18n.t('length_error')
    end}

  validates :bookCover,
    presence: {
      message: -> (rec, data) do
        I18n.t('no_bookCover')
      end}

  validates :schedule,
  presence: {
    message: -> (rec, data) do
      I18n.t('no_schedule')
    end}
#-------------------------------------#

  belongs_to :user#

  has_many :posts, dependent: :destroy#
  has_many :favorites#
  has_many :book_hash_tags#

  has_many :favorite_users,through: :favorites,source: "user"
  mount_uploader :bookCover, ImagesUploader

  # enum progress: {"終了" => true,"継続中" => nil}

  def total_nice_count
    @total_nice_count = 0
    posts.each do |post|
      @total_nice_count += post.nices.count
    end
    return @total_nice_count
  end

  def total_comment_count
    @total_comment_count = 0
    posts.each do |post|
      @total_comment_count += post.comments.count
    end
    return @total_comment_count
  end

end
