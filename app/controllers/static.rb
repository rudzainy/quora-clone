get '/' do
	@questions = Question.all.order(created_at: 'desc')
  erb :"static/index"
end