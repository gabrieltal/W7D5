class Api::SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    
    if user
      login(user)
      return user
    else
      return {}
    end
  end

  def destroy
    if logout
      return {}
    else
      return { error: 'No current user to log out'}
    end
  end
end
