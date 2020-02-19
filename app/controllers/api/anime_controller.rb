class Api::AnimeController < ApplicationController

  def index
    search = build_search_query(params)

    if search[:search_query].empty?
      @anime = Anime.all
    else
      @anime = Anime.where(search[:search_query], *search[:values])
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
