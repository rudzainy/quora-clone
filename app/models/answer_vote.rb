class AnswerVote < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :answer

  # Vote: -1 = downvote, 1 = upvote 

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