class CreateAnswerVotes < ActiveRecord::Migration
	def change
		create_table :answer_votes do |t|
			t.integer :answer_id
			t.integer :vote

			t.timestamps null: false
		end
	end
end
