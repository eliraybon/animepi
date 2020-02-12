class Api::CharactersController < ApplicationController

  def index
    @characters = Character.all
    render json: @characters
  end

  def show
    @character = Character.find_by(id: params[:id])
    if @character
      render json: @character
    else
      render json: ["Character not found"], status: 404
    end
  end
end
