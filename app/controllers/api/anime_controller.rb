class Api::AnimeController < ApplicationController

  def index
    if params[:search]
      search_term = "%#{titleize(params[:search])}%"
      @anime = Anime.where('title LIKE ?', search_term)
    else 
      @anime = Anime.all
    end
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
