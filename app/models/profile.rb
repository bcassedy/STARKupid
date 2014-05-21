# == Schema Information
#
# Table name: profiles
#
#  id             :integer          not null, primary key
#  username       :string(255)      not null
#  age            :integer          not null
#  gender         :string(255)      not null
#  location       :string(255)      not null
#  summary        :text
#  skills         :text
#  interests      :text
#  life_direction :text
#  goals          :text
#  user_id        :integer          not null
#  created_at     :datetime
#  updated_at     :datetime
#

class Profile < ActiveRecord::Base
  validates :username, :age, :gender, :location, :user_id, presence: true

  def self.search_by_username(username)
    Profile.where(['username LIKE ?', "%#{username}%"])
  end
end
