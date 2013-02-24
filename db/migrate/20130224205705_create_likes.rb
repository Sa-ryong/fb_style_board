class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :target, polymorphic: true, null: false
      t.integer :author_id, null: false
      t.string :guid, null: false

      t.boolean :positive, default: true
      t.string :author_name, null: false

      t.timestamps
    end
  end
end
