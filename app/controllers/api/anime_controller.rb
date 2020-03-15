class Api::AnimeController < ApplicationController

  def index
    @is_admin = admin?
    search = build_search_query(params)

    if search[:search_query].empty?
      #if there is no order param... Rails will make query SELECT anime.* FROM anime
      anime = Anime.all.order(search[:order])
    else
      anime = Anime.where(search[:search_query], *search[:values]).order(search[:order])
    end

    anime_per_page = 10
    page = params[:page] ? params[:page].to_i : 1
    @count = anime.count
    max_page = (@count / anime_per_page) + (@count % anime_per_page == 0 ? 0 : 1)
    @next_page = page + 1 <= max_page ? page + 1 : nil
    @prev_page = page - 1 > 0 ? page - 1 : nil
    @anime = anime.limit(10).offset((page - 1) * anime_per_page)

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
