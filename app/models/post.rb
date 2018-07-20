class Post < ApplicationRecord
  mount_uploader :post_image, PostUploader
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :likers, :through => :likes, :source => :user
  has_many :taggings
  has_many :tags, :through => :taggings, :source => :tag

 #image uploads


  #validations
  validates :caption, length: { maximum: 250 }
  #validates :post_image, presence: true
end
