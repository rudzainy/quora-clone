get '/' do
	all_questions
	@index = true
  erb :"static/index"
end