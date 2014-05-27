class Favorite < ActiveRecord::Base
  validates :favorited_id, :profile_id, presence: true
end
