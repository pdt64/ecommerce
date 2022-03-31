class AboutController < ApplicationController
  def show
    @page = Page.find(1)
  end
end
