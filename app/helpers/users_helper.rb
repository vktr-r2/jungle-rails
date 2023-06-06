module UsersHelper
  def generate_flash(user)
    if user.errors.details[:email]&.any? && user.errors.details[:email][0][:error] == :taken
      "Email has already been taken"
    elsif user.errors.details[:password_confirmation]&.any?
      "Password confirmation doesn't match Password"
    else
      "Something went wrong. Please try again."
    end
  end
end
