class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #validations
  validates :text, presence: true,  length: { maximum: 250 }
end
