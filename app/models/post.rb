class Post < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  mount_uploader :post_image, PostUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, :through => :likes, :source => :user
  has_many :taggings, dependent: :destroy
  has_many :tags, :through => :taggings, :source => :tag
  accepts_nested_attributes_for :tags

 #image uploads


  #validations
  validates :caption, length: { maximum: 250 }
  validates :post_image, :caption, presence: true

end
