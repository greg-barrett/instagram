class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :caption
      t.string :post_image
      t.integer :user_id

      t.timestamps
    end
  end
end
