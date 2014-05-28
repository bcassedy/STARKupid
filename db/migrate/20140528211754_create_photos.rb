class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url, null: false
      t.integer :profile_id, null: false

      t.timestamps
    end

    add_index :photos, :profile_id
  end
end
