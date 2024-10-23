class Public::GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    @items = @genre.items
  end
end
