class Tag < ApplicationRecord
  before_validation :lowercase, :hashit
  has_many :posts, :through => :taggings

  validates :hashtag, presence: true, uniqueness: true
  #regex for tags

  private
  #formatters
  def lowercase
    self.hashtag= self.hashtag.downcase
  end

  def hashit
    self.hashtag="#"+ self.hashtag if self.hashtag[0]!="#"
  end

end
