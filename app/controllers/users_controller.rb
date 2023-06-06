class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      if user.errors.details[:email]&.any? && user.errors.details[:email][0][:error] == :taken
        flash[:alert] = "Email has already been taken"
      elsif user.errors.details[:password_confirmation]&.any?
        flash[:alert] = "Password confirmation doesn't match Password"
      else
        flash[:alert] = "Something went wrong. Please try again."
      end
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
