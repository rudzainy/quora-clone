class CreateQuestionVotes < ActiveRecord::Migration
	def change
		create_table :question_votes do |t|
			t.integer :question_id
			t.integer :vote

			t.timestamps null: false
		end
	end
end
