class HomeController < ApplicationController
  def index
    @records = Record.includes(:genre)
                 .limit(10)

    @genres = Genre.limit(10)
  end
end
