class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, default: 'Post', null: false
      t.integer :author_id, null: false
      t.string :guid, null: false

      t.text :body, null: false
      t.integer :likes_count, default: 0
      t.string :author_name, null: false

      t.timestamps
    end
  end
end
