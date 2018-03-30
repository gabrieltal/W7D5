class Api::PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
    render :index
  end

  def show
    @poke = Pokemon.find(params[:id])
    render :show
  end

  def create
    @poke = Pokemon.new(poke_params)
    @poke.save!
    render :show
  end

  private 

  def poke_params
    params.require(:pokemon).permit(:name,:image_url,:attack,:defense,:poke_type,:moves)
  end
end
