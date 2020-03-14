class Api::AnimeController < ApplicationController

  def index
    @is_admin = admin?
    search = build_search_query(params)

    if search[:search_query].empty?
      #if there is no order param... Rails will make query SELECT anime.* FROM anime
      @anime = Anime.all.order(search[:order])
    else
      @anime = Anime.where(search[:search_query], *search[:values]).order(search[:order])
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
