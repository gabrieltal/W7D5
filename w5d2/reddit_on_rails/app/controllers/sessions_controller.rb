class SessionsController < ApplicationController
  before_action :new_user_session_block, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login(@user)
      redirect_to subs_url
    else
      flash[:errors] = ["Invalid username/password"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
