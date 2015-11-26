post '/answers/create' do
	@answer = Answer.create(params[:answer])
	@message = "Your answer has been posted!"
	redirect to "/questions/#{@answer.question.id}"
end

get '/answers/:id' do
	@answer = Answer.find(params[:id])
	erb :"answer/show"
end

get '/answers/:id/update' do
	@answer = Answer.find(params[:id])
	erb :"answer/edit"
end

patch '/answers/:id' do
	answer = Answer.find(params[:id])
	answer.update(params[:answer])
	@message = "Profile updated."
	redirect to "/questions/#{answer.question.id}"
end

delete '/answers/:id' do
	answer = Answer.find(params[:id])
	answer.destroy
	@message = "Answer has been successfully deleted."
	redirect to "/questions/#{answer.question.id}"
end