post '/questions/:id/upvote' do

	if session[:user_id]
		@question = Question.find(params[:id])
		question_vote = QuestionVote.find_by(question_id: @question.id, user_id: current_user.id)
		if !question_vote.nil?
			if question_vote.downvoted?
				question_vote.change_vote
				redirect to "/questions/#{@question.id}"
			else
				@message = "You can only upvote once per post!"
				@question_vote_count = @question.count_votes
				@answers = Answer.where(question_id: @question.id)
				erb :"question/show"
			end
		else
			QuestionVote.create(question_id: @question.id, user_id: current_user.id, vote: 1)
			@question_vote_count = count_votes('question', @question.id)
			@answers = Answer.where(question_id: @question.id)
			erb :"question/show"
		end
	else
		@message = "Please log in or sign up to vote."
		erb :"user/new"
	end
end

post '/questions/:id/downvote' do
	
	if session[:user_id]
		@question = Question.find(params[:id])
		question_vote = QuestionVote.find_by(question_id: @question.id, user_id: current_user.id)
		if !question_vote.nil?
			if question_vote.upvoted?
				question_vote.change_vote
				redirect to "/questions/#{@question.id}"
			else
				@message = "You can only downvote once per post!"
				@question_vote_count = count_votes('question', @question.id)
				@answers = Answer.where(question_id: @question.id)
				erb :"question/show"
			end
		else
			QuestionVote.create(question_id: @question.id, user_id: current_user.id, vote: -1)
			@question_vote_count = count_votes('question', @question.id)
			@answers = Answer.where(question_id: @question.id)
			erb :"question/show"
		end
	else
		@message = "Please log in or sign up to vote."
		erb :"user/new"
	end
end