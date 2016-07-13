class CreateAnswers < ActiveRecord::Migration
  def change
  	create_table :answers do |a|
  		a.belongs_to :question, index: true
  		a.string :answer, :unique => true
  		a.integer :vote_like
  		a.integer :vote_dislike

  		a.timestamp null: false
  	end
  end
end
