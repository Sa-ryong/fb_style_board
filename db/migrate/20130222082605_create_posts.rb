class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false

      t.string  :subject
      t.text    :body,    null: false
      t.integer :like,    default: 0
      t.integer :dislike, default: 0

      t.timestamps
    end

    add_index :posts, [:user_id, :created_at]
  end
end
