class Api::CharactersController < ApplicationController

  # def index
  #   p params
  #   # if we are getting all the characters for a particular anime...
  #   if params[:anime_id]
  #     #find all the characters of that anime
  #     @anime = Anime.find_by(id: params[:anime_id])
  #     @characters = @anime.includes(:anime).characters
  #   else 
  #     #otherwise, we are going to use a page system, with 10 chars per page
  #     #we get the page from the query string, or set it to 1 by default 
  #     @page = params[:page] ? params[:page].to_i : 1
  #     #using the page, we set range of ids we need to retrieve
  #     range = @page * 10 - 9..@page * 10
  #     #fetch to characters
  #     @characters = Character.includes(:anime).where(id: range)
  #     #to calculate the last page, we use the id of the last character 
  #     @max_page = Character.last.id / 10 + 1
  #   end
  #   render :index
  # end

  def show
    @character = Character.find_by(id: params[:id])
    if @character
      render :show
    else
      render json: ["Character not found"], status: 404
    end
  end

  def index 
    search = build_search_query(params)

    if search[:search_query].empty? 
      @characters = Character.includes(:anime).all
    else
      @characters = Character
                      .includes(:anime)
                      .where(search[:search_query], *search[:values])
    end

    render :index
  end

end
