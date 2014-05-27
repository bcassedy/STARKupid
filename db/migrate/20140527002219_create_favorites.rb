class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :favorited_id, null: false
      t.integer :profile_id, null: false

      t.timestamps
    end

    add_index :favorites, :profile_id
    add_index :favorites, [:profile_id, :favorited_id], unique: true
  end
end
