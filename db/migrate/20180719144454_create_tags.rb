class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :hashtag

      t.timestamps
    end
    add_index :tags, :hashtag, unique: true
  end
end
