class GenresController < ApplicationController
  def index
    @genres = Genre.order(created_at: :desc).page(params[:page])
  end

  def show
    @genre = Genre.find(params[:id])
  end
end
