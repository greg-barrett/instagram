class AddUniquenessIndexToFollwoings < ActiveRecord::Migration[5.1]
  def change
    add_index :followings, [:followed_id, :follower_id], unique: true
    add_index :taggings, [:tag_id, :post_id], unique: true
    add_index :likes, [:user_id, :post_id], unique: true
  end
end
