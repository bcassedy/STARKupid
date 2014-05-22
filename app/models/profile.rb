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
#  height         :string(255)
#  body_type      :string(255)
#  drinks         :string(255)
#  job            :string(255)
#  income         :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Profile < ActiveRecord::Base
  validates :username, :age, :gender, :location, :user_id, presence: true
  belongs_to :user

  def self.search_by_username(username)
    Profile.where(['username LIKE ?', "%#{username}%"])
  end
end
