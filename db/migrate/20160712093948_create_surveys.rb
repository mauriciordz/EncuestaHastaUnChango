class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |s|
      s.belongs_to :user, index: true
      s.string :survey

      s.timestamp null: false
    end
  end
end
