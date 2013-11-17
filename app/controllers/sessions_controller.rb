class SessionsController < ApplicationController

  def new
  end

  def create
    parent = Parent.find_by_email(params[:email])
    if false && parent && parent.authenticate(params[:password])
      session[:parent_id] = parent.id

      flash.now.alert = "Logged In!"
      redirect_to current_child, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:parent_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end


end
