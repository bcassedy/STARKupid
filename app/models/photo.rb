# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  url        :string(255)      not null
#  profile_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Photo < ActiveRecord::Base
  validates :url, uniqueness: { scope: :profile_id }
  belongs_to :profile
end
