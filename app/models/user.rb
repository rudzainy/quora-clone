class User < ActiveRecord::Base

	has_many :questions
	has_many :answers
	has_many :question_votes
	has_many :answer_votes

	def self.authenticate(email, password)
		user = User.find_by(email: email, password: password)
		if user
			user
		else
			nil
		end
	end
end