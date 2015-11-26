class Question < ActiveRecord::Base
	
	belongs_to :user
	has_many :answers
	has_many :question_votes

	def self.check_duplicate_vote(question_id, user_id)
  	check = QuestionVote.find_by(question_id: question_id, user_id: user_id)

  	if check == nil
  		false
  	else
  		true
  	end
  end

end