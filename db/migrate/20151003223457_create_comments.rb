class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :owner_id
      t.integer :commentable_id
      t.string :commentable_type
      t.text :content
    end
  end
end
