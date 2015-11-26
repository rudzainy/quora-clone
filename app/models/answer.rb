class Answer < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :question
	has_many :answer_votes

end