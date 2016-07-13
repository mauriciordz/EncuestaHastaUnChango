class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |q|
    q.belongs_to :survey, index: true
  	q.string :question, :unique => true
    q.integer :vote_like
  	q.integer :vote_dislike

  	q.timestamp null: false
  	end
  end
end
