class Answer < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :question
	has_many :answer_votes

  def count_votes
    votes = 0
    AnswerVote.where(answer_id: self.id).each do |answer|
      votes += answer.vote
    end
    votes
  end

end