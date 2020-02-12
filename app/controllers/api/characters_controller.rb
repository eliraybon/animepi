class Api::CharactersController < ApplicationController

  def index
    anime = Anime.find_by(id: params[:anime_id])
    if anime
      @characters = anime.characters
    else 
      @characters = Character.all
    end
    render :index
  end

  def show
    @character = Character.find_by(id: params[:id])
    if @character
      render :show
    else
      render json: ["Character not found"], status: 404
    end
  end
end
