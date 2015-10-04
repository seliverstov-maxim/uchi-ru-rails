class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.boolean :public, default: false
      t.integer :owner_id
      t.string :language
      t.string :state
      t.text :content
      t.text :description
      t.datetime :deleted_at
    end
  end
end
