class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]
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
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  #username regex


  #devise username setup
  attr_writer :login
  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  elsif conditions.has_key?(:username) || conditions.has_key?(:email)
    conditions[:email].downcase! if conditions[:email]
    where(conditions.to_h).first
  end
end

end
