class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :user_id
      t.text :body
      t.boolean :published
      t.datetime :published_at

      t.timestamps null: false
    end
  end
end
