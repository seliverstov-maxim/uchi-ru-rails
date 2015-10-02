class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.string :name
      t.integer :owner_id
      t.string :display

      t.timestamp
    end
  end
end
