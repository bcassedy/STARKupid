class AnswerChoice < ActiveRecord::Base
  validates :choice, presence: true
  belongs_to :question
end
