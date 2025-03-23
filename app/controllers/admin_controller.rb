class AdminController < ApplicationController
  def login
    if request.post?
      if params[:username] == "admin" && params[:password] == "nimda"
       session[:admin] = "admin"
       redirect_to job_seekers_url
      else
        flash[:notice] = "Invalid username/password.Try again"
        render :action=> "login"
      end
    end
  end

  def logout
    session[:admin] = nil
    flash[:notice] = "You are logged out"
    redirect_to admin_login_url
  end
end
