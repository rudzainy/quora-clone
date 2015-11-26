helpers do

	def count_votes(vote_count)
		if vote_count == nil
			vote_count = 0
		else
			vote_count = vote_count.count
		end
	end

end