class Comment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  belongs_to :post

  #validations
  validates :text, presence: true,  length: { maximum: 250 }
end
