class SessionController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to root_path
    else
      flash.now[:alert] = "Login failed."
      render :action => "new"
    end
  end

  def destroy
    logout
    redirect_to(root_path, :notice => 'Logged out!')
  end
end
