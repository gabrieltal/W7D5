class ArtworksController < ApplicationController
  def index
    artworks = Artwork.all
    render json: artworks
  end

  def create
    artwork = Artwork.new(params[:artwork].permit(:title, :image_url, :artist_id))
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    if artwork
      render json: artwork
    else
      render plain: "Artwork doesn't exist"
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update_attributes(artwork_params)
      render json: artwork
    else
      render plain: "Wrong!", status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
