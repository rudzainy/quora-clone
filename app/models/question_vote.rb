class QuestionVote < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :question

	# Vote: 0 = downvote, 1 = upvote 

	def voted?(question_id)
		if QuestionVote.find_by(question_id: question_id, user_id: current_user.id)
			true
		else
			false
		end
	end

	def create_vote(question_vote)
		QuestionVote.create(question_vote)
	end

end