post '/signup' do
	user = User.create(params[:user])
	@message = "Signed up. You may now login."
	all_questions
	erb :"static/index"
end

post '/login' do
	@user = User.authenticate(params[:user][:email], params[:user][:password])
	if @user == nil
		@message = "Login failed!"
		erb :"user/new"
	else
		session[:user_id] = @user.id
		
		if @user.name == nil
			@message = "Welcome to Kuora! Please update your profile here."
			erb :"user/edit"
		else
			@message = "Welcome back!"
			all_questions
			erb :"static/index"
		end
	end
end

get '/login' do
	erb :"user/new"
end

get '/logout' do
	session[:user_id] = nil
	@message = "You are successfully logged out."
	all_questions
	erb :"static/index"
end

get '/users/:id' do
	@user = User.find(params[:id])
	@questions = Question.where(user_id: @user.id)
	@answers = Answer.where(user_id: @user.id)
	erb :"user/show"
end

get '/users/:id/update' do
	@user = User.find(params[:id])
	erb :"user/edit"
end

patch '/users/:id' do
	user = User.find(params[:id])
	user.update(params[:user])
	@message = "Profile updated."
	redirect to "/users/#{user.id}"
end