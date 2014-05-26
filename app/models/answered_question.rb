# == Schema Information
#
# Table name: answered_questions
#
#  id          :integer          not null, primary key
#  profile_id  :integer          not null
#  question_id :integer          not null
#  answer_id   :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class AnsweredQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :profile
  belongs_to :answer, class_name: 'AnswerChoice', foreign_key: :answer_id
end
