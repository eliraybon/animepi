class Api::AnimeController < ApplicationController

  def index
    @anime = Anime.all
    render :index
  end

  def show
    @anime = Anime.find_by(id: params[:id])
    if @anime
      render :show
    else 
      render json: ["Anime not found"], status: 404
    end
  end

end
