class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password, length: { minimum: 8 }


  def self.authenticate_with_credentials(email, password)
    # Normalize email address (downcase and strip leading/trailing spaces)
    email = email.strip.downcase
    user = User.find_by_email(email)

    # If user exists and the password entered is correct
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
