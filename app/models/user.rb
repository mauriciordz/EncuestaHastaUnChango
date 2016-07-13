class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  has_many :surveys
  validates :user_name, presence: true, uniqueness: true
  validates :mail, presence: true, uniqueness: true
  validates :password, presence: true

  # def self.authenticate(email, password)

  #   # si el email y el password corresponden a un usuario valido, regresa el usuario
  #   # de otra manera regresa nil
  #   user_find = User.find_by(mail: email)
  #   if email == user_find.mail && password == user_find.password
  #     user_find
  #   else
  #     nil
  #   end
  # end

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(email, user_password)
    user = User.find_by(mail: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end

end
