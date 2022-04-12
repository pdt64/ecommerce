class GenresController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    @genres = Genre.order(created_at: :desc).page(params[:page])
    add_breadcrumb "Genres", :genres_index_path
  end

  def show
    @genre = Genre.find(params[:id])
    add_breadcrumb "Genres", :genres_index_path
    add_breadcrumb @genre.name, :genres_show_path
  end
end
