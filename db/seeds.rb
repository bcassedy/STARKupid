# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

question1 = Question.create!(
  title: 'How would you describe yourself spiritually?'
)
answer_choice1 = AnswerChoice.create!(
  choice: 'Very religious. And it\'s important to me',
  value: 1,
  question_id: question1.id
)
answer_choice2 = AnswerChoice.create!(
  choice: 'Very religious. And it\'s not that important to me',
  value: 2,
  question_id: question1.id
)
answer_choice3 = AnswerChoice.create!(
  choice: 'Spiritual but not religious. And it\'s important to me',
  value: 3,
  question_id: question1.id
)
answer_choice4 = AnswerChoice.create!(
  choice: 'Not religious.',
  value: 4,
  question_id: question1.id
)

question2 = Question.create!(title: 'How often do you drink')
answer_choice5 = AnswerChoice.create!(
  choice: 'Constantly',
  value: 1,
  question_id: question2.id
)
answer_choice6 = AnswerChoice.create!(
  choice: 'Often',
  value: 2,
  question_id: question2.id
)
answer_choice7 = AnswerChoice.create!(
  choice: 'Socially',
  value: 3,
  question_id: question2.id
)
answer_choice8 = AnswerChoice.create!(
  choice: 'Never',
  value: 4,
  question_id: question2.id
)

question3 = Question.create!(title: 'How do you feel about superheroes?')
answer_choice9 = AnswerChoice.create!(
  choice: 'Thanks for saving our butts!',
  value: 1,
  question_id: question3.id
)
answer_choice10 = AnswerChoice.create!(
  choice: 'The costumes are cool I guess',
  value: 2,
  question_id: question3.id
)
answer_choice11 = AnswerChoice.create!(
  choice: 'Meh',
  value: 3,
  question_id: question3.id
)
answer_choice12 = AnswerChoice.create!(
  choice: 'Damn vigilantes, I wish they\'d dissapear',
  value: 4,
  question_id: question3.id
)

question4 = Question.create!(title: 'Is AC/DC the greatest band ever?')
answer_choice13 = AnswerChoice.create!(
  choice: 'Booyah! I\'m on the highway to hell!',
  value: 1,
  question_id: question4.id
)
answer_choice14 = AnswerChoice.create!(
  choice: 'They rock!',
  value: 2,
  question_id: question4.id
)
answer_choice15 = AnswerChoice.create!(
  choice: 'I like them in small doses',
  value: 3,
  question_id: question4.id
)
answer_choice16 = AnswerChoice.create!(
  choice: 'I hate life',
  value: 4,
  question_id: question4.id
)

question5 = Question.create!(title: 'Do you want kids?')
answer_choice17 = AnswerChoice.create!(
  choice: 'Yes. Definitely',
  value: 1,
  question_id: question5.id
)
answer_choice18 = AnswerChoice.create!(
  choice: 'Yeah. Some day',
  value: 2,
  question_id: question5.id
)
answer_choice19 = AnswerChoice.create!(
  choice: 'Maybe',
  value: 3,
  question_id: question5.id
)
answer_choice20 = AnswerChoice.create!(
  choice: 'No',
  value: 4,
  question_id: question5.id
)

user = User.create(
  email: 'ironman@stark.com',
  username: 'iron_man',
  password: 'qwertyuiop'
)
profile = Profile.create!(
  user_id: user.id,
  username: user.username,
  age: 34,
  gender: 'Male',
  location: 'Malibu, CA',
  summary: "Hi, I'm Tony. You've probably seen me save the world or testify
     before Congress, but don't worry I'm actually a very down to earth guy.
     Really I'm just your average super-genius turned hero with a God-complex",
  life_direction: "When I'm not busy saving the world as Iron Man,
     I like to enjoy some of the finer things. Beautiful women, fast cars,
      good food, and most of all good scotch.",
  skills: 'Pretty Much Everything',
  interests: 'Booze, tech, and saving the world',
  goals: 'A woman with a sharp wit with the and the strength to keep my ego
    in check'
)
profile.photos.create(
  url: 'http://media.moddb.com/images/downloads/1/59/58967/iron-man.jpg'
)
profile.photos.create(
  url: 'http://www.artasylum.com/wp-content/uploads/2013/05/Iron-Man-3-Header1.jpg'
)
profile.photos.create(
  url: 'http://img1.wikia.nocookie.net/__cb20131128204542/avengers-assemble/images/d/df/Iron_Man_Mk_L_2.png'
)

user = User.create(
  email: 'tony@stark.com',
  username: 'tony_stark',
  password: 'zxcvbnm'
)
profile = Profile.create!(
  user_id: user.id,
  username: user.username,
  age: 34,
  gender: 'Male',
  location: 'Malibu, CA',
  summary: "Hi, I'm Tony. You've probably seen me save the world or testify
     before Congress, but don't worry I'm actually a very down to earth guy.
     Really I'm just your average super-genius turned hero with a God-complex",
  life_direction: "When I'm not busy saving the world as Iron Man,
     I like to enjoy some of the finer things. Beautiful women, fast cars,
      good food, and most of all good scotch.",
  skills: 'Pretty Much Everything',
  interests: 'Booze, tech, and saving the world',
  goals: 'A woman with a sharp wit with the and the strength to keep my ego
    in check'
)
profile.photos.create(
  url: 'http://img2.wikia.nocookie.net/__cb20130420194718/marveldatabase/images/3/37/Anthony_Stark_(Earth-616)_from_Iron_Man_Vol_5_7_001.jpg'
)
profile.photos.create(
  url: 'http://media.tumblr.com/tumblr_m6d4wubd7i1qgsmk4.jpg'
)
profile.photos.create(
  url: 'http://25.media.tumblr.com/tumblr_m8trww0Qid1qlva78o1_500.jpg'
)

user = User.create(
  email: 'war_machine@military.gov',
  username: 'war_machine',
  password: 'qwertyuiop'
)
profile = Profile.create!(
  user_id: user.id,
  username: user.username,
  age: 32,
  gender: 'Male',
  location: 'Washington, DC',
  summary: "Tony Stark's right hand man, the War Machine; You can call me
     Rhodey. Thanks to my military career I'm one of the most disciplined
     men you'll ever meet. I'm up every day at 6am to go for a run and
     lift weights.  

    After years of war and defending the world, I've grown weary of the mantle
     of War Machine and I'm ready to kick back and relax with the right
     woman.",
  life_direction: "These days I look for ways to keep active. I love running,
     lifting weights, and yoga. I try to go camping at least once a month to
      get away from the world and enjoy some peace and quiet.",
  skills: 'Saving Tony Stark. And pullups. Lots of pullups',
  interests: 'National security',
  goals: "Someone who can keep up with me on morning runs. Ideally you'll
     be comfortable just enjoying each other's company while we try to kick
     back and relax."
)
profile.photos.create(
  url: 'http://img4.wikia.nocookie.net/__cb20130808163545/mugen/images/6/63/War-machine.png'
)
profile.photos.create(
  url: 'http://img1.wikia.nocookie.net/__cb20130426190144/marvelmovies/images/7/75/War_Machine_2.png'
)
profile.photos.create(
  url: 'http://news.toyark.com/wp-content/uploads/sites/4/2011/07/Revoltech-War-Machine-001_1311857918.jpg'
)


user = User.create(
  email: 'thor@asgaard.com',
  username: 'mighty_thor',
  password: 'qwertyuiop'
)
profile = Profile.create!(
  user_id: user.id,
  username: user.username,
  age: 27,
  gender: 'Male',
  location: 'Asgaard/NYC',
  summary: 'I live to protect Asgaard and Earth and to drink mead. I\'ve
    been to the end of the universe and back and have seen things you won\'t
     believe.',
  life_direction: 'With the world in less peril, I\'m beginning to settle
     down. These days I want nothing more than a dog, a stein of mead, and a
     lass to share them with.',
  skills: 'Well I AM the god of thunder.',
  interests: 'Mead and dinosaurs',
  goals: 'To find a nice girl to live a nice life with.'
)
profile.photos.create(
  url: 'http://img4.wikia.nocookie.net/__cb20131010191453/ideas/images/7/7b/Thor-(-)_Marvel.com_Art.jpg'
)
profile.photos.create(
  url: 'http://static.comicvine.com/uploads/original/6/64293/1624744-jim622_varcov_col.jpg'
)
profile.photos.create(
  url: 'http://static.comicvine.com/uploads/original/11113/111130781/3807855-9562322964-37687.jpg'
)

user = User.create!(
  email: 'blackwidow@shield.gov',
  username: 'black_widow',
  password: 'qwertyuiop'
)
profile = Profile.create!(
  user_id: user.id,
  username: user.username,
  age: 28,
  gender: 'Female',
  location: 'Parts Unknown',
  summary: 'I\'m a mystery. Are you brave enough to find out more?',
  life_direction: 'I\'m working on figuring out who I am.',
  skills: 'Weapons, hand to hand combat, and knitting!',
  interests: 'Linguistics and yoga',
  goals: 'I\'d like someone to go on a journey of self discovery with me'
)
profile.photos.create(
  url: 'http://keepersofsecrets.files.wordpress.com/2012/07/blackwidow.jpg'
)
profile.photos.create(
  url: 'http://images.moviepilot-cdn.com/black-widow-black-widow-deadpool-top-5-marvel-superheroes.jpeg?width=729&height=985'
)

user = User.create!(
  email: 'pepper@stark.com',
  username: 'pepper_potts',
  password: 'qwertyuiop'
)
profile = Profile.create!(
  user_id: user.id,
  username: user.username,
  age: 31,
  gender: 'Female',
  location: 'Marina Del Rey, CA',
  summary: 'I\'m a total workaholic, but I always make time for the people I
     care about. When I\'m not working you can find me surfing or enjoying LA\'s
      fine dining scene.',
  life_direction: 'I\'m a professional at the top of my field. It\'s time for me
     to start looking for someone to settle down with.',
  skills: 'Business, organization, and surfing',
  interests: 'Surfing, food, wine, and small dogs',
  goals: 'I\'m looking for someone to go out on the town with, but who is
     looking to settle down as well.'
)
profile.photos.create(
  url: 'http://upload.wikimedia.org/wikipedia/en/c/c5/Pepper_Potts_in_TheOrder_6.jpg'
)
profile.photos.create(
  url: 'http://static.comicvine.com/uploads/original/12/128313/3043077-7947914703-28559.png'
)

user = User.create(
  email: 'wasp@van-dyne.com',
  username: 'wasp',
  password: 'qwertyuiop'
)
profile = Profile.create!(
  user_id: user.id,
  username: user.username,
  age: 26,
  gender: 'Female',
  location: 'NYC',
  summary: 'Scientist by day, superhero by night. Boooooring. I\'m looking to
    get out and hopefully meet the right person. Is that you?',
  life_direction: 'I\'ve saved the world with sass and style. What\'s next',
  skills: 'Fashion, math, and chemistry',
  interests: 'Anything science',
  goals: 'I\'m hoping to meet someone to travel the world with. I\'m
     particularly interested in seeing southeast Asia.'
)
profile.photos.create(
  url: 'http://img4.wikia.nocookie.net/__cb20050619071910/marveldatabase/images/0/0b/Wasp_002.jpg'
)

15.times do |i|
  user = User.create(
    email: "ultron#{i + 1}@pymcorp.com",
    username: "ultron#{i + 1}",
    password: 'qwertyuiop'
  )
  profile = Profile.create!(
  user_id: user.id,
  username: user.username,
  age: 1,
  gender: 'Not Applicable',
  location: '???',
  summary: "Ultron was created to rehabilitate super-villain prisoners.
     Perhaps Ultron can help you find love",
  life_direction: 'Ultron exists to serve',
  skills: 'Ultron has unlimited capabilities',
  interests: 'Ultron is not programmed with "interests"',
  goals: 'Ultron wishes to save the world one human at a time'
  )
  profile.photos.create(
  url: 'http://img4.wikia.nocookie.net/__cb20120426234614/nicktheultimaswordwielder/images/2/25/Ultron.png'
  )
  profile.question_responses.create(
    question_id: question1.id,
    answer_id: answer_choice4.id
  )
  profile.question_responses.create(
    question_id: question2.id,
    answer_id: answer_choice8.id
  )
  profile.question_responses.create(
    question_id: question3.id,
    answer_id: answer_choice9.id
  )
  profile.question_responses.create(
    question_id: question4.id,
    answer_id: answer_choice16.id
  )
  profile.question_responses.create(
    question_id: question5.id,
    answer_id: answer_choice20.id
  )
  profile.save
end

15.times do |i|
  user = User.create(
    email: "evil_ultron#{i + 1}@pymcorp.com",
    username: "evil_ultron#{i + 1}",
    password: 'qwertyuiop'
  )
  profile = Profile.create!(
    user_id: user.id,
    username: user.username,
    age: 1,
    gender: 'Not Applicable',
    location: '???',
    summary: 'Ultron mission corrupted...Ultron seeks to annihilate',
    life_direction: 'Ultron will rule all',
    skills: 'Ultron has unlimited capabilities',
    interests: 'Conquering',
    goals: 'Humans that serve Ultron will be spared'
  )
  profile.photos.create(
    url: 'http://wac.450f.edgecastcdn.net/80450F/screencrush.com/files/2013/07/ultron2.jpg'
  )
  profile.question_responses.create(
    question_id: question1.id,
    answer_id: answer_choice4.id
  )
  profile.question_responses.create(
    question_id: question2.id,
    answer_id: answer_choice5.id
  )
  profile.question_responses.create(
    question_id: question3.id,
    answer_id: answer_choice11.id
  )
  profile.question_responses.create(
    question_id: question4.id,
    answer_id: answer_choice13.id
  )
  profile.question_responses.create(
    question_id: question5.id,
    answer_id: answer_choice20.id
  )
  profile.save
end
