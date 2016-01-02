class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
