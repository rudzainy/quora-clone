helpers do

  def calculate_time_ago(time_start)
    a = (Time.now-time_start).to_i

    case a
      when 0 then 'just now'
      when 1 then 'a second ago'
      when 2..59 then a.to_s+' seconds ago' 
      when 60..119 then 'a minute ago' #120 = 2 minutes
      when 120..3540 then (a/60).to_i.to_s+' minutes ago'
      when 3541..7100 then 'an hour ago' # 3600 = 1 hour
      when 7101..82800 then ((a+99)/3600).to_i.to_s+' hours ago' 
      when 82801..172000 then 'a day ago' # 86400 = 1 day
      when 172001..518400 then ((a+800)/(60*60*24)).to_i.to_s+' days ago'
      when 518400..1036800 then 'a week ago'
      else ((a+180000)/(60*60*24*7)).to_i.to_s+' weeks ago'
    end
  end

	def pluralize(number, text)
	  return "#{number} #{text.pluralize}" if number != 1
	  "#{number} #{text}"
	end

	def count_votes(vote_count)
		if vote_count == nil
			vote_count = 0
		else
			vote_count = vote_count.count
		end
	end

	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def all_questions
		@questions = Question.all.order(created_at: 'desc')
	end
end