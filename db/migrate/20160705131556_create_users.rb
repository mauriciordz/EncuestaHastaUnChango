class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :user_name, :unique => true
      u.string :mail,  :unique => true
      u.string :password_digest
      
      u.timestamps
    end
  end
end
