class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name,  presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105}, 
              uniqueness: {case_sensitive: false},
              format: {with: VALID_EMAIL_REGEX}

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    #require 'pry'; binding.pry
    user && user.authenticate(:password)
     
  end
end
