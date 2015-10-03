class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.text :description
      t.text :content
      t.integer :owner_id
      t.string :language
      t.string :public, default: false
      t.string :state
      t.datetime :deleted_at
    end
  end
end
