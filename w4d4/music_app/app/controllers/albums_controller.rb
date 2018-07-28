class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      render json: @album.errors.full_messages, status: 422
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to bands_url
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      render json: @album.errors.full_messages, status: 422
    end
  end

  def album_params
    params.require(:album).permit(:title, :year, :band_id, :album_type)
  end

end
