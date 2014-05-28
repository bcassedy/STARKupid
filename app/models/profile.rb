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
#  photo_url      :string(255)
#

class Profile < ActiveRecord::Base
  validates :username, :age, :gender, :location, :user_id, presence: true
  belongs_to :user
  has_many :question_responses, class_name: 'AnsweredQuestion'
  has_many :visits
  has_many :visitors, through: :visits, source: :visitor
  has_many :favorites
  has_many :favorited_profiles, through: :favorites, source: :favorite
  has_many :photos
  attr_accessor :match_percentage

  def self.search_by_username(username)
    Profile.where(['username LIKE ?', "%#{username}%"])
  end

  def match(other_profile)
    match_answered_questions = sort_responses(other_profile)
    match_answered_questions_ids = get_answered_question_ids(
      match_answered_questions
    )
    # debugger
    answered_questions = sort_responses(self)
    answered_questions_in_common = get_responses_in_common(
      answered_questions,
      match_answered_questions_ids
    )
    question_ids_in_common = get_answered_question_ids(
      answered_questions_in_common
    )
    match_answered_questions_in_common = get_responses_in_common(
      match_answered_questions,
      question_ids_in_common
    )
    calculate_match_rating(
      answered_questions_in_common,
      match_answered_questions_in_common
    )
  end

  private

  def get_answered_question_ids(answered_questions)
    answered_questions.map { |resp| resp.question_id }
  end

  def calculate_match_rating(answers_in_common, match_answers_in_common)
    return 0 if match_answers_in_common.count < 5
    response_diffs_sum = 0
    answers_in_common.each_with_index do |resp, i|
      response_diffs_sum += (resp.answer.value -
        match_answers_in_common[i].answer.value).abs
    end
    # get avg dif(lower is better) 1 - avg dif/4 gets match %
    ((1 - (response_diffs_sum.to_f /
      match_answers_in_common.count / 4)) * 100).round
  end

  def sort_responses(profile)
    responses = Profile.includes(question_responses: :answer)
      .find(profile.id).question_responses
    responses.sort_by do |response|
      response.question_id
    end
  end

  def get_responses_in_common(responses, question_ids)
    responses.select do |resp|
      question_ids.include?(resp.question_id)
    end
  end
end
