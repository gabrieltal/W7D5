class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(params[:user].permit(:username))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render plain: "User doesn't exist"
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: user
    else
      render plain: "Wrong!", status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  def artworks
    user_art = Artwork.find_by(artist_id: params[:id])
    render json: user_art
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
