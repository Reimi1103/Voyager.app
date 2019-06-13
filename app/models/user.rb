class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true



  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest,User.digest(remember_token))
  end


  def authenticated?(remember_token)
  return false if remember_digest.nil?
  BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
    
  end



  has_many :posts,dependent: :destroy
  has_many :books,dependent: :destroy
  has_many :favorites,dependent: :destroy
  
  has_many :favorite_books,through: :favorites,source: "book"

  has_many :comments,dependent: :destroy
  has_many :relationships
  has_many :nices, dependent: :destroy
  has_many :nice_posts, through: :nices, source: :post
  has_many :points,dependent: :destroy
  has_many :withdrawals
  has_one :bank_accounts

  #mount_uploader :image, ImagesUploader
  mount_uploader :thanksImage, ImagesUploader
  mount_uploader :image, CloudinaryImageUploader

  has_many :active_relationships,  class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower


  def follow(other_user)
    following << other_user
  end
  
    def unfollow(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
    end

    def following?(other_user)
      following.include?(other_user)
    end

  end
