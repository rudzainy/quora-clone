class AddUserIdForVoting < ActiveRecord::Migration
	def change
		add_column :question_votes, :user_id, :integer
		add_column :answer_votes, :user_id, :integer
	end
end
