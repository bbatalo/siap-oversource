class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :legacy_id
      t.datetime :legacy_date
      t.string :tag
      t.text :content
      t.integer :up_vote_count
      t.integer :down_vote_count
      t.integer :comment_count

      t.timestamps
    end
  end
end
