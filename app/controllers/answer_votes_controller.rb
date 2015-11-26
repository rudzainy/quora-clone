post '/questions/:question_id/answer/:answer_id/upvote' do
	@question = Question.find(params[:question_id])
	answer = Answer.find(params[:answer_id])
	answer_vote = AnswerVote.find_by(answer_id: answer.id, user_id: current_user.id)
	
	if session[:user_id]
		if !answer_vote.nil?
			if answer_vote.downvoted?
				answer_vote.change_vote
				redirect to "/questions/#{@question.id}"
			else
				@message = "You can only upvote once per answer!"
				@question_vote_count = @question.count_votes
				@answers = Answer.where(question_id: @question.id)
				erb :"question/show"
			end
		else
			AnswerVote.create(answer_id: answer.id, user_id: current_user.id, vote: 1)
			@question_vote_count = @question.count_votes
			@answers = Answer.where(question_id: @question.id)
			erb :"question/show"
		end
	else
		@message = "Please log in or sign up to vote."
		erb :"user/new"
	end
end

post '/questions/:question_id/answer/:answer_id/downvote' do
	@question = Question.find(params[:question_id])
	answer = Answer.find(params[:answer_id])
	answer_vote = AnswerVote.find_by(answer_id: answer.id, user_id: current_user.id)
	
	if session[:user_id]
		if !answer_vote.nil?
			if answer_vote.upvoted?
				answer_vote.change_vote
				redirect to "/questions/#{@question.id}"
			else
				@message = "You can only downvote once per answer!"
				@question_vote_count = @question.count_votes
				@answers = Answer.where(question_id: @question.id)
				erb :"question/show"
			end
		else
			AnswerVote.create(answer_id: answer.id, user_id: current_user.id, vote: -1)
			@question_vote_count = @question.count_votes
			@answers = Answer.where(question_id: @question.id)
			erb :"question/show"
		end
	else
		@message = "Please log in or sign up to vote."
		erb :"user/new"
	end
end