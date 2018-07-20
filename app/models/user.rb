class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :liked_posts, :through => :likes, :source => :post

  has_many :active_followings, class_name: "Following", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_followings, class_name: "Following", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_followings, source: :followed
  has_many :followers, through: :passive_followings, source: :follower

  #validations
  validates :first_name, :surname, :username, :email, presence: true
  validates :email, :username, uniqueness: { case_sensitive: false, message: "%{value} already taken." }
  validates :username, length: { in: 6..25}
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  #username regex
end
