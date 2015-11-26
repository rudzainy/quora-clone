class QuestionVote < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :question

	# def create_vote(question_vote)
	# 	QuestionVote.create(question_vote)
	# end

  # Vote: -1 = downvote, 1 = upvote 

  # def self.voted?
  #   QuestionVote.find_by(question_id: self.id, user_id: current_user.id)
  # end

  def upvoted?
    true if self.vote == 1
  end

  def downvoted?
		true if self.vote == -1
	end

  def change_vote
    if self.vote == 1
      self.update(vote: -1)
    else
      self.update(vote: 1)
    end
  end

end