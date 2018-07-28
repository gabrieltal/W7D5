class ArtworkSharesController < ApplicationController

  def create
    # debugger
    artwork_share = ArtworkShare.new(artwork_shares_params)
    if artwork_share.save
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: 422
    end
  end

  def destroy
    artshare = ArtworkShare.find(params[:id])
    artshare.destroy
    render json: artshare
  end

  def artwork_shares_params
    params.require(:artshare).permit(:artwork_id, :viewer_id)
  end
end
