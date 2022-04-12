class HomeController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    @records = Record.includes(:genre)
                     .limit(10)

    @genres = Genre.limit(10)
  end
end
