class AddPhotoUrlToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :photo_url, :string
  end
end
