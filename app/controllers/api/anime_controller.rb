class Api::AnimeController < ApplicationController

  def index
    @anime = Anime.all
    render json: @anime
  end

  def show
    @anime = Anime.find_by(id: params[:id])
    if @anime
      render json: @anime
    else 
      render json: ["Anime not found"], status: 404
    end
  end

end
