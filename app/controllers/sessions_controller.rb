class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
    # If user is authenticated
    if user
      # Save user_id in browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user login dails, send user back to login form.
      redirect_to '/login'
    end
  end
  

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end