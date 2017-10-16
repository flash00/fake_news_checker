class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :password_hash, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :articles, through: :articles_users

  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def login?(session)
    if session[:id]
      true
    else
      false
    end
  end
end
