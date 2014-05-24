class Question < ActiveRecord::Base
  validates :title, presence: true
  has_many :answer_choices
end
