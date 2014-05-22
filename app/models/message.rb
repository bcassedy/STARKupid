# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  sender_id   :integer          not null
#  receiver_id :integer          not null
#  title       :string(255)      not null
#  body        :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Message < ActiveRecord::Base
  validates :sender_id, :receiver_id, :title, :body, presence: true
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  belongs_to :receiver, class_name: 'User', foreign_key: :sender_id
end
