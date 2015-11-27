# Create default user
User.create(name: 'Tommy Middlefinger', email: 'tommy@gmail.com', password: '123456', description: '50% Jedi, 50% Sith, 100% Vulcan', avatar: "http://localhost:9393/img/mabul.jpg")

# Seed 50 random users
50.times do
	description = Faker::Name.title + ", " + Faker::Company.bs.capitalize
	User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123456', description: description, avatar: Faker::Avatar.image)
end

# Seed 75 random questions
75.times do
	body = ""
	rand(1..3).times do
		body += Faker::Hacker.say_something_smart + " "
	end
	Question.create(body: body, user_id: rand(1..51))
end

# Seed 200 random answers
200.times do
	body = ""
	rand(1..10).times do
		body += Faker::Hacker.say_something_smart + " "
	end
	Answer.create(body: body, question_id: rand(1..75), user_id: rand(1..51))
end

# Fix exclamation mark in questions
Question.all.each do |question|
	question.body = question.body.gsub('!', '.')
	question.save
end

# Fix exclamation mark in answers
Answer.all.each do |answer|
	answer.body = answer.body.gsub('!', '.')
	answer.save
end

# Seed votes to questions and answers
User.all.each do |user|
	Question.all.each do |question|
		if rand(3) != 1
			if rand(3) != 1
				vote = 1
			else
				vote = -1
			end
			QuestionVote.create(question_id: question.id, user_id: user.id, vote: vote)
		end
		if !question.answers.nil?
			question.answers.all.each do |answer|
				if rand(3) != 1
					if rand(3) != 1
						vote = 1
					else
						vote = -1
					end
					AnswerVote.create(answer_id: answer.id, user_id: user.id, vote: vote)
				end
			end
		end
	end
end