post '/questions/create' do

	if session[:user_id]
		@question = Question.create(body: params[:question][:body], user_id: current_user.id)
		@message = "Your question has been posted!"
		all_questions
		@index = true
		erb :"static/index"
	else
		@message = "Please log in or sign up to post questions."
		erb :"user/new"
	end
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	@answers = Answer.where(question_id: @question.id)
	@question_vote_count = @question.count_votes
	erb :"question/show"
end

get '/questions/:id/edit' do
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
	if question.nil?
		@message = "Unable to delete question."
		erb :"question/edit"
	else
		question.answers.each do |answer|
			answer.destroy
		end
		question.destroy
		@message = "Question has been successfully deleted."
		all_questions
		@index = true
		erb :"static/index"
	end
end