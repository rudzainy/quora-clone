post '/questions/create' do

	if session[:user_id]
		@question = Question.create(body: params[:question][:body], user_id: current_user.id)
		@message = "Your question has been posted!"
		@questions = Question.all
		erb :"static/index"
	else
		@message = "Please log in or sign up to post questions."
		erb :"user/new"
	end
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	@answers = Answer.where(question_id: @question.id)
	vote_count = QuestionVote.find_by(question_id: @question.id)
	@vote_count = count_votes(vote_count)
	erb :"question/show"
end

get '/questions/:id/update' do
	@question = Question.find(params[:id])
	erb :"question/edit"
end

patch '/questions/:id' do
	question = Question.find(params[:id])
	question.update(params[:question])
	@message = "Profile updated."
	redirect to "/questions/#{question.id}"
end

delete '/questions/:id' do
	question = Question.find(params[:id])
	question.destroy
	@message = "Question has been successfully deleted."
	@questions = Question.all
	erb :"static/index"
end