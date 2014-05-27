# == Schema Information
#
# Table name: favorites
#
#  id           :integer          not null, primary key
#  favorited_id :integer          not null
#  profile_id   :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Favorite < ActiveRecord::Base
  validates :favorited_id, :profile_id, presence: true
  belongs_to :profile
  belongs_to :favorite, class_name: 'Profile', foreign_key: :favorited_id
end
