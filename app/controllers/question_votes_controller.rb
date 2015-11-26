post '/questions/:id/upvote' do
	@question = Question.find(params[:id])
	@answers = Answer.where(question_id: @question.id)
	
	if session[:user_id]
		if voted?(@question.id)
			@message = "You can only vote once per post!"
			erb :"question/show"
		else
			create_vote(params[:question_vote])
			@vote_count = QuestionVote.find_by(question_id: @question.id).length
			erb :"question/show"
		end
	else
		@message = "Please log in or sign up to vote."
		erb :"user/new"
	end
end