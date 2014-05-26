# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

question = Question.create(title: 'How would you describe yourself spiritually?')
answer1 = AnswerChoice.create(
  choice: 'Very religious. And it\'s important to me',
  value: 1,
  question_id: question.id
)
answer2 = AnswerChoice.create(
  choice: 'Very religious. And it\'s not that important to me',
  value: 2,
  question_id: question.id
)
answer3 = AnswerChoice.create(
  choice: 'Spiritual but not religious. And it\'s important to me',
  value: 3,
  question_id: question.id
)
answer4 = AnswerChoice.create(
  choice: 'Not religious.',
  value: 4,
  question_id: question.id
)

question = Question.create(title: 'How often do you drink')
answer1 = AnswerChoice.create(
  choice: 'Constantly',
  value: 1,
  question_id: question.id
)
answer2 = AnswerChoice.create(
  choice: 'Often',
  value: 2,
  question_id: question.id
)
answer3 = AnswerChoice.create(
  choice: 'Socially',
  value: 3,
  question_id: question.id
)
answer4 = AnswerChoice.create(
  choice: 'Never',
  value: 4,
  question_id: question.id
)

question = Question.create(title: 'How do you feel about superheroes?')
answer1 = AnswerChoice.create(
  choice: 'Thanks for saving our butts!',
  value: 1,
  question_id: question.id
)
answer2 = AnswerChoice.create(
  choice: 'The costumes are cool I guess',
  value: 2,
  question_id: question.id
)
answer3 = AnswerChoice.create(
  choice: 'Meh',
  value: 3,
  question_id: question.id
)
answer4 = AnswerChoice.create(
  choice: 'Damn vigilantes, I wish they\'d dissapear',
  value: 4,
  question_id: question.id
)

question = Question.create(title: 'Is AC/DC the greatest band ever?')
answer1 = AnswerChoice.create(
  choice: 'Booyah! I\'m on the highway to hell!',
  value: 1,
  question_id: question.id
)
answer2 = AnswerChoice.create(
  choice: 'They rock!',
  value: 2,
  question_id: question.id
)
answer3 = AnswerChoice.create(
  choice: 'I like them in small doses',
  value: 3,
  question_id: question.id
)
answer4 = AnswerChoice.create(
  choice: 'I hate life',
  value: 4,
  question_id: question.id
)

question = Question.create(title: 'Do you want kids?')
answer1 = AnswerChoice.create(
  choice: 'Yes. Definitely',
  value: 1,
  question_id: question.id
)
answer2 = AnswerChoice.create(
  choice: 'Yeah. Some day',
  value: 2,
  question_id: question.id
)
answer3 = AnswerChoice.create(
  choice: 'Maybe',
  value: 3,
  question_id: question.id
)
answer4 = AnswerChoice.create(
  choice: 'No',
  value: 4,
  question_id: question.id
)